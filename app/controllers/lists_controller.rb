class ListsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @list = List.new
  end

  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    @list = List.new(list_params)
    if @list.save  # 3. データが入力されていればデータをデータベースに保存するためのsaveメソッド実行
      # 4. フラッシュメッセージを定義し、詳細画面へリダイレクト
      flash[:notice] = "投稿に成功しました。"
      redirect_to list_path(@list.id)  # 「転送したいアクションへのURL」を指定します。
    else  # データが入力されていなければ、saveメソッドでfalseが返されます。
      render :new  #  render :アクション名で、同じコントローラ内の別アクションのViewを表示できます。　
      
      # エラーメッセージを扱う際にはrender、それ以外はredirect_toを使う　
      #@lists = List.all  # renderする際はrenderしたアクションが必要なインスタンス変数を用意しなければなりません。
      #render :index  #<= new から indexに変更 @listsというインスタンス変数がcreateアクション内に定義されていないことが確認できます。
      #redirect_to new_list_path  # renderではなくredirect_toだった場合 createアクション内で発生したバリデーションエラーにはerrorsメソッドでアクセスできなくなります。
    end
  end  
  
  def destroy
    list = List.find(params[:id])  # データ(レコード) を1件取得
    list.destroy  # データ(レコード)を削除
    redirect_to '/lists'  # 投稿一覧画面へリダイレクト
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
  # ストロングパラメータ  投稿機能
  def list_params
    params.require(:list).permit(:title, :body, :image)  # title,body,imageのデータの取得を許可します。
  end
end
