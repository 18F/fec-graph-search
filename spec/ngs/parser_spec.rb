describe "NGS::Parser" do

  describe "basics" do
    it "can return me" do
      cypher = "START me = node({me}) RETURN DISTINCT me"
      params = {"me" => nil}
      expect(NGS::Parser.parse("(me)")).to eq([cypher, params])
    end

    it "can return people that are candidates" do
      cypher = "START people = node:candidates({candidate}) RETURN DISTINCT people"
      params = {"candidate" => "name: **"}
      expect(NGS::Parser.parse("(candidates)")).to eq([cypher, params])
    end

    it "can return people that are.. people" do
      cypher = "START people = node:people({query}) RETURN DISTINCT people"
      params = {"query" => "name: **"}
      expect(NGS::Parser.parse("(people)")).to eq([cypher, params])
    end

    it "can return people that are candidates named jeff" do
      cypher = "START people = node:candidates({candidate}) RETURN DISTINCT people"
      params = {"candidate" => "name: *jeff*"}
      expect(NGS::Parser.parse("(candidates named jeff)")).to eq([cypher, params])
    end

    it "can return people who live in FLorida" do
      cypher = "START people = node:people({query}), place = node:places({place}) MATCH people -[:lives]-> place RETURN DISTINCT people"
      params = {"query"=>"name: **", "place"=>"name: Florida*"}
      expect(NGS::Parser.parse("(people who live in Florida)")).to eq([cypher, params])
    end

    it "can return people who are candidates and live in Florida" do
      cypher = "START people = node:candidates({candidate}), place = node:places({place}) MATCH people -[:lives]-> place RETURN DISTINCT people"
      params = {"candidate"=>"name: **", "place"=>"name: Florida*"}
      expect(NGS::Parser.parse("(candidates who live in Florida)")).to eq([cypher, params])
    end

    it "can return candidates named Leslie Knope and live in Indiana" do
      cypher = "START people = node:candidates({candidate}), place = node:places({place}) MATCH people -[:lives]-> place RETURN DISTINCT people"
      params = {"candidate"=>"name: *Leslie*Knope*", "place"=>"name: Indiana*"}
      expect(NGS::Parser.parse("(candidates named Leslie_Knope who live in Indiana)")).to eq([cypher, params])
    end

    it "can return committees named Americans for Prosperity" do
      cypher = "START committees = node:committees({committee}) RETURN DISTINCT committees"
      params = {"committee"=>"name: *Americans*for*Prosperity*"}
      expect(NGS::Parser.parse("(committees named Americans_for_Prosperity)")).to eq([cypher, params])
    end

    it "can return committees who support Ritt Momney" do
      cypher = "START committees = node:committees({committee}), people = node:candidates({candidate}) MATCH committees -[:supports]-> people RETURN DISTINCT committees, people"
      params = {"candidate"=>"name: *Mitt*Romney*", "committee"=>"name: **"}
      expect(NGS::Parser.parse("(committees who support candidates named Mitt_Romney)")).to eq([cypher, params])
    end


    it "can return committees named Bailey Inc who support candidates named Ritt Momney" do
      cypher = "START committees = node:committees({committee}), people = node:candidates({candidate}) MATCH committees -[:supports]-> people RETURN DISTINCT committees, people"
      params = {"committee"=>"name: *Bailey*Inc*", "candidate"=>"name: *Mitt*Romney*"}
      expect(NGS::Parser.parse("(committees named Bailey_Inc who support candidates named Mitt_Romney)")).to eq([cypher, params])
    end
  end
end