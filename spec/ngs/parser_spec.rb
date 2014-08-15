describe "NGS::Parser" do

  describe "basics" do
    it "can return me" do
      cypher = "START me = node({me}) RETURN DISTINCT me"
      params = {"me" => nil}
      expect(NGS::Parser.parse("(me)")).to eq([cypher, params])
    end

    it "can return people that are candidates" do
      cypher = " MATCH (people:`Candidate`) RETURN DISTINCT people" # space prepended for concatenation
      params = {}
      expect(NGS::Parser.parse("(candidates)")).to eq([cypher, params])
    end

    it "can return people that are.. people" do
      cypher = " MATCH (people:`Person`) RETURN DISTINCT people" # space prepended for concatenation
      params = {}
      expect(NGS::Parser.parse("(people)")).to eq([cypher, params])
    end

    it "can return people who live in FLorida" do

      cypher = "START place = node:places({place}) MATCH (people:`Person`), people -[:lives]-> place RETURN DISTINCT people"
      params = {"place" => "name: florida*"}
      expect(NGS::Parser.parse("(people who live in Florida)")).to eq([cypher, params])
    end

    it "can return people who are candidates and live in Florida" do
      cypher = "START place = node:places({place}) MATCH (people:`Candidate`), people -[:lives]-> place RETURN DISTINCT people"
      params = {"place" => "name: florida*"}
      expect(NGS::Parser.parse("(candidates who live in Florida)")).to eq([cypher, params])
    end

    xit "can return candidates named Knope and live in Indiana" do
      cypher = "START thing = node:things({thing}), place = node:places({place}) MATCH (people:`Candidate`), people -[:lives]-> place RETURN DISTINCT people"
      params = {"thing"=>"name: Knope", "place"=>"name: Indiana*"}
      expect(NGS::Parser.parse("(candidates Knope who live in Indiana)")).to eq([cypher, params])
    end

  end
end