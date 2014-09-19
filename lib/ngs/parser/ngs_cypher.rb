module Ngs
  
  class Expression < Treetop::Runtime::SyntaxNode
    def to_cypher
      cypher_hash =  self.elements[0].to_cypher
      cypher_string = ""
      if cypher_hash[:start].empty?
        # cypher_string = "START n(`Person`)"
      else
        cypher_string << "START "   + cypher_hash[:start].uniq.join(", ") 
      end
      
      if cypher_hash[:match].empty?
        # cypher_string << "MATCH (n:`Person`)"
      else
        cypher_string << " MATCH "  + cypher_hash[:match].uniq.join(", ") unless cypher_hash[:match].empty?
      end
      

      if cypher_hash[:return].empty?
        cypher_string << " RETURN DISTINCT n"
      else
        cypher_string << " RETURN DISTINCT " + cypher_hash[:return].uniq.join(", ")
      end
      
      params = cypher_hash[:params].empty? ? {} : cypher_hash[:params].uniq.inject {|a,h| a.merge(h)}
      return [cypher_string, params].compact
    end
  end
  
  class Body < Treetop::Runtime::SyntaxNode
    def to_cypher
      cypher_hash = Hash.new{|h, k| h[k] = []}
      self.elements.each do |x|
        x.to_cypher.each do |k,v|
          cypher_hash[k] << v
        end
      end
      return cypher_hash
    end
  end
  
  class Me < Treetop::Runtime::SyntaxNode
    def to_cypher
        return {:start => "me = node({me})", 
                :return => "me",
                :params => {"me" => nil }}
    end 
  end


  class Lives < Treetop::Runtime::SyntaxNode
    def to_cypher
        return {:start => "place = node:places({place})",
                :match => "people -[:lives]-> place",

                :params => {"place" => "name: " + self.text_value.split("in ").last.to_s.strip + "*" } }
    end 
  end


  class Thing < Treetop::Runtime::SyntaxNode
    def to_cypher
        return {:start  => "thing = node:things({thing})",
                :params => {"thing" => "name: " + self.text_value } }

    end 
  end

  class Name < Treetop::Runtime::SyntaxNode
    def to_cypher
        {
          :start  => "people = node:people({query})",
          :params => {
            "query" => "name: " + self.text_value.split("named ").last.to_s.strip.gsub('_','*') + "*"
          },
          :return => "people"
        }

    end 
  end

  class People < Treetop::Runtime::SyntaxNode
    def to_cypher
        {
          :start  => "people = node:people({query})",
          :return => "people",
          :params => {
            "query" => "name: *" + self.text_value.split("named ").last.to_s.strip.gsub("people","") + "*"
          }
        }
    end 
  end

  class Candidates < Treetop::Runtime::SyntaxNode
    def to_cypher
      {
        :start  => "people = node:candidates({candidate})",
        :return => "people",
        :params => {
            "candidate" => "name: *" + self.text_value.split("named ").last.to_s.strip.gsub("_","*").gsub("candidates","") + "*"
          }
      }
    end 
  end

  class Committees < Treetop::Runtime::SyntaxNode
    def to_cypher
      {
        :start  => "committees = node:committees({committee})",
        :return => "committees",
        :params => {
            "committee" => "name: *" + self.text_value.split("named ").last.to_s.strip.gsub("_","*").gsub("committees","") + "*"
          }
      }
    end 
  end

  class Contributors < Treetop::Runtime::SyntaxNode
    def to_cypher
      {
        :start  => "people = node:contributors({query})",
        :return => "people",
        :params => {
            "query" => "name: *" + self.text_value.split("named ").last.to_s.strip.gsub("_","*").gsub("contributors","") + "*"
          }
      }
    end 
  end

  class Supports < Treetop::Runtime::SyntaxNode
    def to_cypher
      {
        :match => "committees -[:supports]-> people"
      }
    end 
  end

  
end