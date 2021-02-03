RSpec.describe 'POST /api/articles', type: :request do
let!(:article) { create(:article) }
  describe 'successfully comment on an article' do
    before do
      post "/api/articles/#{article.id}/comments",
        params: {
          comment: {
            body: "firts comment",
            article_id: article.id
          }
        }
    end
    
    it 'is expected to return http status 201' do
      expect(response).to have_http_status 201
    end

    it 'is expected to return a success message' do
      expect(response_json['message']).to eq "your comment was successfully created"
    end
  end

  describe 'sad path' do
    before do
      post "/api/articles/#{article.id}/comments",
        params: {
          comment: {
            article_id: article.id
          }
        }
    end
    
    it 'is expected to return http status 422' do
      expect(response).to have_http_status 422
    end

    it 'is expected to return a success message' do
      expect(response_json['message']).to eq "can't be blank"
    end
  end
end