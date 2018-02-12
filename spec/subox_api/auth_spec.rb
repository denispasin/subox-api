describe SuboxApi::Auth, :vcr do
  let(:client) do
    SuboxApi::Auth.new(nil, username: "Skizzk", password: "12345678", url: "http://0.0.0.0:3000")
  end

  it "is a Faraday middleware" do
    expect(SuboxApi::Auth.ancestors).to include(Faraday::Middleware)
  end

  describe "#parse_auth_token" do
    subject do
      client.send(:parse_auth_token, response_headers)
    end

    context "without auth token" do
      let(:response_headers) { {} }

      it "doesn't fill token" do
        expect{ subject }.not_to(change{ client.instance_variable_get(:@token) })
      end
    end

    context "with auth token" do
      let(:response_headers) {
        {
          "access-token" => Faker::Internet.password,
          "client" => Faker::Internet.password,
          "expiry" => Time.now.to_i + 3000,
          "uid" => Faker::Internet.email
        }
      }

      it "fills the token with the headers info" do
        expect{ subject }.to change{ client.instance_variable_get(:@token) }.to(
          response_headers.merge("token-type" => "bearer")
        )
      end
    end
  end

  describe "#token" do
    subject do
      client.send(:token)
    end

    context "with an already set token" do
      before do
        client.instance_variable_set(:@token, tok: :tok)
      end

      it "doesn't call sign in" do
        expect(client).not_to receive(:sign_in)
        subject
      end
    end

    context "without a @token" do
      it "calls sign_in" do
        expect(client).to receive(:sign_in)
        subject
      end
    end
  end

  describe "#sign_in" do
    subject do
      client.send(:sign_in)
    end

    it "calls the api with the right params" do
      expect(Faraday).to receive(:post).with("http://0.0.0.0:3000/auth/sign_in", login: "Skizzk", password: "12345678").and_return(double("headers", headers: {}))
      subject
    end

    it "sends the headers to parse_auth_token" do
      expect(client).to receive(:parse_auth_token)
      subject
    end
  end
end
