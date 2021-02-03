RSpec.describe 'POST /api/articles', type: :request do
let(:article) { create(:article) }
  describe 'successfully comment on an article' do
    before do
      post "/api/articles/#{article.id}/comments",
        params: {
          comment: "firts comment",
          article_id: article.id
        }
    end
    
    it 'is expected to resturn http status 201' do
      expect(response).to have_http_status 201
    end
    
  end
end