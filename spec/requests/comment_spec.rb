RSpec.describe 'POST /api/articles', type: :request do
let!(:article) { create(:article) }
  describe 'successfully comment on an article' do
    before do
      post "/api/articles/#{article.id}/comments",
        params: {
          comment: "firts comment",
          index_comments_on_article_id: article.id
        }
    end
    
    it 'is expected to return http status 201' do
      expect(response).to have_http_status 201
    end

    it 'is expected to return a success message' do
      expect(response_json['message']).to eq "your comment was successfully created"
    end
  end
end