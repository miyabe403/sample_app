Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'top' => 'homes#top'
  resources :lists  # resourcesメソッドは、ルーティングを一括して自動生成してくれる機能です。
  
  #get 'lists/new'
  #post 'lists' => 'lists#create'
  #get 'lists' => 'lists#index'
  # .../lists/1 や .../lists/3 に該当する
  #get 'lists/:id' => 'lists#show', as: 'list'  # 名前付きルート as:オプションを追加「'lists#show'の設定を、listとして利用できる」
  #get 'lists/:id/edit' => 'lists#edit', as: 'edit_list'  # URLに:idを用いて記述すると、lists/◯◯/editのすべてのURLが対象になります。
  #patch 'lists/:id' => 'lists#update', as: 'update_list'  # 更新の場合はPATCHで指定します。
  #delete 'lists/:id' => 'lists#destroy', as: 'destroy_list'  # HTTPメソッドはDELETE、URLはlists/:idです。名前付きパスは、destroy_listと設定します。
end