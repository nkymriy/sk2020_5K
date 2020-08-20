require 'rails_helper'

#routes.rbを参照しながら記述

RSpec.describe "routes for Users", type: :routing do
  describe 'アクションが実行されているかのテスト' do
    context 'ユーザー認証関連' do
      it 'get account/signin => users/sessions#new' do
        expect(get("account/signin")).to route_to("users/sessions#new")
      end
      it 'post account/signin => users/sessions#create' do
        expect(post("account/signin")).to route_to("users/sessions#create")
      end
      it 'get account/signup => users/registrations#new' do
        expect(get("account/signup")).to route_to("users/registrations#new")
      end
      it 'post account/signup => users/registrations#create' do
        expect(post("account/signup")).to route_to("users/registrations#create")
      end
      it 'get account/signout => users/sessions#destroy' do
        expect(get("account/signout")).to route_to("users/sessions#destroy")
      end
      it 'get user/confirmation => users/confirmations#show' do
        expect(get("user/confirmation")).to route_to("users/confirmations#show")
      end
      it 'post user/confirmation => users/confirmations#create' do
        expect(post("user/confirmation")).to route_to("users/confirmations#create")
      end
    end

    context 'ユーザのホーム画面' do
      it 'get idea => ideas#home' do
        expect(get("idea")).to route_to("ideas#home")
      end
      it 'get idea/home => ideas#home' do
        expect(get("idea/home")).to route_to("ideas#home")
      end
      it 'get idea/history => ideas#history' do
        expect(get("idea/history")).to route_to("ideas#history")
      end
      it 'get idea/category => ideas#category' do
        expect(get("idea/category")).to route_to("ideas#category")
      end
      #idea/account => ideas#account アクションなし
    end

    context 'メモ関連' do
      it 'get idea/memo/new => memo#new' do
        expect(get("idea/memo/new")).to route_to("memo#new")
      end
      it 'post idea/memo/new => memo#new' do
        expect(post("idea/memo/new")).to route_to("memo#new")
      end
      it 'post idea/memo => memo#create' do
        expect(post("idea/memo")).to route_to("memo#create")
      end
      #TODO: idがないとテスト出来ないため、今後Factory-botに使って完成させる
      # it 'get idea/memo/edit/:id => memo#edit' do
      #   expect(get("idea/memo/edit/:id")).to route_to("memo#edit")
      # end
      it 'patch /idea/memo => memo#update' do
        expect(patch("/idea/memo")).to route_to("memo#update")
      end
    end

    context 'ブレインストーミング関連' do
      it 'get idea/brainstorming/new => brainstorming#new' do
        expect(get("idea/brainstorming/new")).to route_to("brainstorming#new")
      end
      it 'get idea/brainstorming/replay => brainstorming#replay' do
        expect(get("idea/brainstorming/replay")).to route_to("brainstorming#replay")
      end
      it 'post idea/brainstorming/create => brainstorming#create' do
        expect(post("idea/brainstorming/create")).to route_to("brainstorming#create")
      end
      #TODO: idがないとテスト出来ないため、今後Factory-botに使って完成させる
      # it 'get idea/brainstorming/edit/:id => brainstorming#edit' do
      #   expect(get("idea/brainstorming/edit/:id")).to route_to("brainstorming#edit")
      # end
    end
  end
end
