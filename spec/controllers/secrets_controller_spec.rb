require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe SecretsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Secret. As you add validations to Secret, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SecretsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all secrets as @secrets" do
      secret = Secret.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:secrets)).to eq([secret])
    end
  end

  describe "GET #show" do
    it "assigns the requested secret as @secret" do
      secret = Secret.create! valid_attributes
      get :show, {:id => secret.to_param}, valid_session
      expect(assigns(:secret)).to eq(secret)
    end
  end

  describe "GET #new" do
    it "assigns a new secret as @secret" do
      get :new, {}, valid_session
      expect(assigns(:secret)).to be_a_new(Secret)
    end
  end

  describe "GET #edit" do
    it "assigns the requested secret as @secret" do
      secret = Secret.create! valid_attributes
      get :edit, {:id => secret.to_param}, valid_session
      expect(assigns(:secret)).to eq(secret)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Secret" do
        expect {
          post :create, {:secret => valid_attributes}, valid_session
        }.to change(Secret, :count).by(1)
      end

      it "assigns a newly created secret as @secret" do
        post :create, {:secret => valid_attributes}, valid_session
        expect(assigns(:secret)).to be_a(Secret)
        expect(assigns(:secret)).to be_persisted
      end

      it "redirects to the created secret" do
        post :create, {:secret => valid_attributes}, valid_session
        expect(response).to redirect_to(Secret.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved secret as @secret" do
        post :create, {:secret => invalid_attributes}, valid_session
        expect(assigns(:secret)).to be_a_new(Secret)
      end

      it "re-renders the 'new' template" do
        post :create, {:secret => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested secret" do
        secret = Secret.create! valid_attributes
        put :update, {:id => secret.to_param, :secret => new_attributes}, valid_session
        secret.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested secret as @secret" do
        secret = Secret.create! valid_attributes
        put :update, {:id => secret.to_param, :secret => valid_attributes}, valid_session
        expect(assigns(:secret)).to eq(secret)
      end

      it "redirects to the secret" do
        secret = Secret.create! valid_attributes
        put :update, {:id => secret.to_param, :secret => valid_attributes}, valid_session
        expect(response).to redirect_to(secret)
      end
    end

    context "with invalid params" do
      it "assigns the secret as @secret" do
        secret = Secret.create! valid_attributes
        put :update, {:id => secret.to_param, :secret => invalid_attributes}, valid_session
        expect(assigns(:secret)).to eq(secret)
      end

      it "re-renders the 'edit' template" do
        secret = Secret.create! valid_attributes
        put :update, {:id => secret.to_param, :secret => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested secret" do
      secret = Secret.create! valid_attributes
      expect {
        delete :destroy, {:id => secret.to_param}, valid_session
      }.to change(Secret, :count).by(-1)
    end

    it "redirects to the secrets list" do
      secret = Secret.create! valid_attributes
      delete :destroy, {:id => secret.to_param}, valid_session
      expect(response).to redirect_to(secrets_url)
    end
  end

end
