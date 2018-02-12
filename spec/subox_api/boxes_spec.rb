describe SuboxApi::Boxes, :vcr do
  def client
    SuboxApi::Client.new(username: "Skizzk", password: "12345678", url: "http://0.0.0.0:3000")
  end

  subject do
    client.boxes
  end

  describe "#all" do
    # for now this test is dummy since I can't create boxes
    it "returns all the boxes" do
      expect(subject.all.data).to eq([])
    end
  end
end
