describe "NGS::Parser" do

  describe "basics" do
    it "can return me" do
      cypher = "START me = node({me}) RETURN DISTINCT me"
      params = {"me" => nil}
      expect(NGS::Parser.parse("(me)")).to eq([cypher, params])
    end

    it "can return my friends" do
      cypher = "START me = node({me}) MATCH me -[:friends]-> people RETURN DISTINCT people"
      params = {"me" => nil}
      expect(NGS::Parser.parse("(friends)")).to eq([cypher, params])
    end

    it "can return people that are candidates" do
      cypher = "START people = node:people(\"is_candidate:true\") RETURN DISTINCT people"
      params = {}
      expect(NGS::Parser.parse("(candidates)")).to eq([cypher, params])
    end

    it "can return friends who like cheese" do
      cypher = "START me = node({me}), thing = node:things({thing}) MATCH me -[:friends]-> people, people -[:likes]-> thing RETURN DISTINCT people"
      params = {"me" => nil, "thing" => "name: cheese"}
      expect(NGS::Parser.parse("(friends who like cheese)")).to eq([cypher, params])
    end

    it "can return friends who like cheese and crackers" do
      cypher = "START me = node({me}), thing1 = node:things({thing1}), thing2 = node:things({thing2}) MATCH me -[:friends]-> people, people -[:likes]-> thing1, people -[:likes]-> thing2 RETURN DISTINCT people"
      params = {"me" => nil, "thing1" => "name: cheese", "thing2" => "name: crackers"}
      expect(NGS::Parser.parse("(friends who like cheese and crackers)")).to eq([cypher, params])
    end

    it "can return people who like cheese" do
      cypher = "START thing = node:things({thing}) MATCH people -[:likes]-> thing RETURN DISTINCT people"
      params = {"thing" => "name: cheese"}
      expect(NGS::Parser.parse("(people who like cheese)")).to eq([cypher, params])
    end

    it "can return people who like cheese and crackers" do
      cypher = "START thing1 = node:things({thing1}), thing2 = node:things({thing2}) MATCH people -[:likes]-> thing1, people -[:likes]-> thing2 RETURN DISTINCT people"
      params = {"thing1" => "name: cheese", "thing2" => "name: crackers"}
      expect(NGS::Parser.parse("(people who like cheese and crackers)")).to eq([cypher, params])
    end

    it "can return people who live in FLorida" do
      cypher = "START place = node:places({place}) MATCH people -[:lives]-> place RETURN DISTINCT people"
      params = {"place" => "name: Florida*"}
      expect(NGS::Parser.parse("(people who live in Florida)")).to eq([cypher, params])
    end

    it "can return people who like cyling and live in Florida" do
      cypher = "START thing = node:things({thing}), place = node:places({place}) MATCH people -[:likes]-> thing, people -[:lives]-> place RETURN DISTINCT people"
      params = {"thing" => "name: cycling", "place" => "name: Florida*"}
      expect(NGS::Parser.parse("(people who like cycling and live in Florida)")).to eq([cypher, params])
    end

    it "can return people who are candidates and live in Florida" do
      cypher = "START people = node:people(\"is_candidate:true\"), place = node:places({place}) MATCH people -[:lives]-> place RETURN DISTINCT people"
      params = {"place" => "name: Florida*"}
      expect(NGS::Parser.parse("(candidates who live in Florida)")).to eq([cypher, params])
    end

    it "can return candidates named Knope and live in Indiana" do
      cypher = "START people = node:people(\"is_candidate:true\"), thing = node:things({thing}), place = node:places({place}) MATCH people -[:lives]-> place RETURN DISTINCT people"
      params = {"thing"=>"name: Knope", "place"=>"name: Indiana*"}
      expect(NGS::Parser.parse("(candidates named Leslie Knope who live in Indiana)")).to eq([cypher, params])
    end


  end
end