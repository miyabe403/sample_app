class ListsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @list = List.new
  end

  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    list = List.new(list_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    list.save
    # 4. 詳細画面へリダイレクト
    redirect_to list_path(list.id)  # 「転送したいアクションへのURL」を指定します。
  end  
    
  def index
    @lists = List.all  # allメソッドを使ってデータベース内のデータを全て取得する
  end

  def show
    @list = List.find(params[:id])  # URLが/lists/1の場合、params[:id] と記述すると、id=1を取り出せます。
  end

  def edit
    @list = List.find(params[:id])  # 投稿済みのデータを編集するので、保存されているデータを取得します。
  end
  
  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end  
  
  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body)
  end
end
