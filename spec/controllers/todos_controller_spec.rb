require 'rails_helper'

describe TodosController do
  before :each do
    get :new
  end
  
  describe 'POST #new' do
    it "assigns :new Todo to @todo" do
      expect(assigns(:todo)).to be_a_new(Todo)
    end
  
    it "render :new template after create :new Todo" do
      expect(response).to render_template :new
    end
  end
end
