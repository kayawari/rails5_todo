require 'rails_helper'

describe TodosController do
  describe 'POST #new' do
    it "assigns :new Todo to @todo" do
      get :new
      expect(assigns(:todo)).to be_a_new(Todo)
    end
  
    it "render :new template after create :new Todo" do
      get :new
      expect(response).to render_template :new
    end
  end
end
