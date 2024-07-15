Rails.application.routes.draw do
  get 'homes/top'
  root to: "homes#top"    #ルートパスで設定
end
