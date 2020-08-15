class CreateSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :searches do |t|
      t.integer  "user_id"
      t.string   "age"            #配列[35,50]
      t.string   "blood"          #配列[a,b] 　該当するもの
      t.string   "brother"        #配列[1,2,3]  マスター必要
      t.string   "prefecture_id"  #配列[34,35,36] 都道府県マスター必要
      t.string   "birthplace_id"  #配列[34,35,36] 都道府県マスター参照
      t.integer  "study"          #最終学歴       マスター必要   
      t.integer  "job"            #選択           マスター必要
      t.string   "money"          #値 3           
      t.string   "height"         #配列[170,180]       
      t.string   "figure"         #どれか一つ　　
      t.string   "marriage"       #どれか一つ 
      t.string   "children"       #none:いない、separation:いる（別居）、share:いる（同居）
      t.string   "purpose"        #1:すぐにでも結婚、2:2,3年のうちに、3:いい人がいればしたい、4:今のところ考えてない、5:わからない
      t.string   "housework"      #家事ができるか？ 1,2,3,4,5段階
      t.string   "request"        #会うまでの希望 (1:まずは会いたい、2:気が合えば会いたい、3:きちんとメッセージを重ねてから会いたい)
      t.string   "housemate"      #同居人（1：一人暮らし 2:実家、3: ........)
      t.string   "holiday"        #休み(1:土日、2:平日、3:不定期)
      t.string   "liquor"         #お酒（1:飲む、2:ために飲む、3:飲めない）
      t.string   "tobacco"        #タバコ(1:吸う、2:吸わない 3:たまに吸う)
      t.text   "hobby"            #趣味（自由入力）
      t.timestamps
    end
  end
end
