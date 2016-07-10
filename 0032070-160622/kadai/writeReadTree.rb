# coding: utf-8
require 'json'
load('./make_binary_search_tree.rb')

# 階層データをJSONに変換してtxtに書き込み
def write_tree(filename, tree)
  File.open(filename, "w"){|file|
    file.puts tree.to_json
  }
end

# txtに書き込んであるJSONを読み込んで階層データに
def read_tree(filename)
  File.open(filename, "r"){|file|
    file.each{|line|
      # これだと1行目だけを返す？
      return JSON.parse(line)
    }
  }
end

# test
a = [3,1,6,1,7,9,2,0,5]
tree = make_binary_search_tree(a)

# txtにtreeを書き込み
write_tree("writeReadTree.txt", tree)

# txtに書き込んであるJSONを読み込む
t = read_tree("writeReadTree.txt")

# 復元できているかの確認
# 元のtree
p tree
p "-------------"
# txtから読み込んだtree
p t
