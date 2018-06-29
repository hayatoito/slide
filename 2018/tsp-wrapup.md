# TSP - Wrap-up

hayato@google.com

---

# レビュー例

- [1](https://github.com/akariiijima/google-step-tsp/commit/dbef1dacce8f1b31f29d389335523fa217275fe0#diff-0eb072bd8eb1ec6c23e52b4d31f7003aR52)
- [2](https://github.com/Yukiha-A/google-step-tsp/commit/1c6b6fe17a84e71032c0bda7b3ba33dd7187cd8a#diff-b31f6708cd9e6a900dd6e18fad189605R9)
- [3](https://github.com/p623/google-step-tsp/commit/7f39fac12a70e9e6a28cfb85119654dd4c098d3a#diff-d438ce540089ff28b507491ad8b56359R76)
- ...後日、追加予定 (お待ちください... ）

---

- 総当り: 例: [Team Java](https://github.com/mizuki1029/google-step-tsp/commit/da3f50b08642cae4bb460b8d9cc5f84fa362e43a)、他多数
- DP: 例: [Team C++](https://github.com/rika77/google-step-tsp/commit/8da837fd34c2a3067c308054be5a50f53100bc40)
- 2-opt: 例: [Team Python 2](https://github.com/Yukiha-A/google-step-tsp/commit/1c6b6fe17a84e71032c0bda7b3ba33dd7187cd8a#diff-b31f6708cd9e6a900dd6e18fad189605R9)
- SA (焼きなまし法): TODO: 後で追加
- GA (遺伝的アルゴリズム): TODO: 後で追加
- Good README.md: [Team Python3](https://github.com/Chenyang08/google-step-tsp)

---

# Challenge 7

- N = 1 << 22 (= 4,194,304)
  - O(N^2) を絶対に許さないという意図が込められています。

---

- サイズが大きな問題はサイズが小さな問題に分割しましょう。
- 現実の問題はサイズ N が大きな問題がよくあります。
  - O(N^2) という贅沢がいつも許されるとは限りません。
- コード例: [Team Rust](https://gist.github.com/hayatoito/dbca6f354d484a760d865bf9fea6468e)

---

# MVP

[@rika77](https://github.com/rika77/google-step-tsp/commits/master) (Team C++)


---

チームのみんなを助けてくれたで賞

[@kochigami](https://github.com/kochigami) ([Team C](https://github.com/Hinako-Suzuki/google-step-tsp))


---

[Office Hours (Team Python 4)](https://photos.app.goo.gl/pnwg7yizbc89nrc37)

---

来年に向けての課題 (1/2)

- Git, GitHub を使用した基本的なワークフローで困る人が相当いました。
  - => 基本的なのガイドを準備したほうがよい？

- どこまでアドバイスするべきか判断が難しかったです。各チームの議論の邪魔になるかも..。
  - => 明確に「アドバイスがほしい！」シグナルのサインを決めておいたほうがよかった？

---

来年に向けての課題 (2/2)

- Speed Challenge にあまり興味をもってもらえなかった。
  - => もう少し興味をもってもらえるように来年はがんばります。

- 他になにか改善すべき点があったら教えてください！

---

# フィードバック

---

コーディングスタイル

- 一貫したコーディングスタイルを使用しましょう。
  - インデント、スペースの有無、関数や変数の命名規則など。
- 特にチーム開発では、スタイルガイドを決めることで、スタイルに関するメンバー間の
  無駄な議論をなくすることができます。
  - 例: Python: [pep8](http://pep8-ja.readthedocs.io/ja/latest/)
  - 例: C++: [Google C++ Style Guide](https://google.github.io/styleguide/cppguide.html)
- 実際のプロジェクトでは、余分な空白が一個でもあると警告されます。:)

---

リーダブルコード（読みやすいコード）

- 本: [リーダブルコード](https://www.amazon.co.jp/dp/4873115655)([The Art of Readable Code](https://www.amazon.com/dp/0596802293))

---

ソースコード・自動フォーマット

- 機械にできるところは、機械にやらせましょう。
- 例: Python: [autopep8](https://github.com/hhatto/autopep8)
- 例: C++: [clang-format](https://clang.llvm.org/docs/ClangFormat.html)

---

デバッグ

- `print` デバッグもよいですが、積極的に `assert` も使用しましょう。
  - 例: Team Python 2: [sample](https://github.com/Yukiha-A/google-step-tsp/commit/3e2a4f79ac97ae269ab6eed7803b82e6748d98ac) (from オフィス・アワー)
- 目視によるデバッグは疲れます。
- "意図"はできるだけコードで表現しましょう。
- `assert` をうまく利用するとコードがプロっぽくなります。:)

---

コーディング・インタビューについて<br>インタビュアーの立場からアドバイス

---

（用意されている）基本的なデータ構造は積極的に利用しましょう。

- TSP: （練習のため)自分が書いたコード、またはチームが書いたコードを見て、`set`,
  `dict` (Python の場合)などが利用できるところがあったら書き換えてみましょう。
  - 例: [Team Python 1](https://github.com/akariiijima/google-step-tsp/commit/dbef1dacce8f1b31f29d389335523fa217275fe0#diff-0eb072bd8eb1ec6c23e52b4d31f7003aR52)
  - Hash Table を使うべきところで Array や List を使わないようにしましょう。意識してやってみましょう。
    - Liner Search: O(N) => Hash Table Lookup: O(1)

---


|        | Dynamic Array | Hash Map / Hash Set           | Binary Tree (Map / Set) |
| ------ | ------------- | ----------------------------- | ----------------------- |
| Rust   | Vec           | HashMap / HashSet             | BTreeMap / BTreeSet     |
| C++    | vector        | unordered_map / unordered_set | map / set               |
| Python | list          | dict / set                    | -                       |
| Java   | ArrayList     | HashMap / HashSet             | TreeMap / TreeSet       |
| C      | -             | -                             | -                       |

---

ただし暗記するのではなく、メモリ上でこれらがどのように表現されているかの明確なイメージを持ちましょう。

- 暗記する必要はなくなります。
- 計算量も自然に導けます。

---

効率よく知識を身に着けましょう

- 良質な本は世の中にあふれています。
  - ただし駄目な本はもっと世の中にあふれています。気をつけましょう。
- 例:
  [世界で闘うプログラミング力を鍛える本 ~コーディング面接 189 問とその解法](https://www.amazon.co.jp/dp/4839960100/)
- コンピュータ・サイエンスは比較的、独学に向いている分野です。興味のある分野はどんどん独学しましょう。

---

公式ドキュメント（一次情報）重要

- 公式ドキュメントをひととおり読みましょう。何が用意されているか大体知っておきま
  しょう。知らないと損です。
- API を正確に覚える必要は _まったく_ ありません。
  - `append`? `push`? `push_back`? `add`? `insert`?

---

ホワイトボード

- ホワイトボードはみんなの味方です。恐れないで。
- ホワイトボードに書けるのはコードだけでありません!
  - 必要に応じてなんでもどんどん書きましょう。
  - 補助として絵で説明したほうが方針が伝わりやすいこともあります。頭の中に浮かんだことを書きましょう。
- ホワイトボードでは `print` デバッグはできません！

---

具体的な入力例で考える

- 困ったら具体的な入力例（値）で具体的に考えましょう！
- 具体的な数値で考えることで、バグが見つかることは多々あります。

---

焦らないでください

- いきなりコードを書き出す前に、少し考えたほうがよい場合も多々あります。
- 焦らないで、リラックス、リラックス。

---

インタビュアー（面接官）は味方です

- 「面接官 vs 候補者」 => 「問題 vs (候補者 + 面接官)」
- 「黙って考える時間がほしい」と「途方にくれてしまい何をしたらよいかまったくわか
  らない」の違いを知りたがっています。インタビュアーはできるだけ時間を有効に使ってほしいと切に願って
  います。
- 「途方にくれてしまい何をしたらよいかまったくわからない」ときは沈黙しないほうが
  よいです。 ==> 時間を有効に使うため、ヒントを求めましょう。

---

書き終えた後

- ひととおり書きおえた後には、具体的な入力を使用して、動作をテスト・チェックしましょう。
  - ホワイトボードに具体的な値を書いていきましょう。
- 間違ったコードを書くことを必要以上に恐れないで。最初から完璧なコードを書ける人間はいません。

---

計算量重要

- TSP: 練習として今回の TSP でチームのみんなが書いた各関数の計算量を見積もってみましょう O(N)? O(N^2)? O(N^3)?
- 例: 貪欲法(greedy)の計算量は?: O(???)
- 例: 焼きなまし方を早くするには？各ループの計算量は？
- 例: 同じものを何度も計算するのを避けるには？ -> 一度計算して覚えておいて再利用。TSP: 2 点間の距離の計算。
- メモリ使用量と実行速度は一般にトレードオフの関係。
- 「このコードは O(N^2) だけど どうやったら速くなりますか？」

---

本質的でないところに時間を<br>あまり使わないように

- 本質的ではない部分 => 「とりあえずこの部分はこういう関数 `XXX` があるとします。
  入力はこう、出力はこうです。...関数 `XXX` は後で書きます。」
- 普通はインタビュアーがアドバイスしてくれると思いますが、念の為。

--

問題を一度に全部解こうとしない

- 悩んだら、長くなってきたら、困ったら...=> 別の関数に分割することを考えましょう 。
- 別の関数に分割すること => 問題・処理を分割することです
- 例: [Team Java](https://github.com/mizuki1029/google-step-tsp/commit/8e9e5d10f86943492347b1a44ee07874b7ec8f76)
- 実際は、そんなに長い関数を書く必要があることはまれのはずです。

---

各関数の入力と出力を明確にしましょう

- 関数の結果が、入力のパラメータ以外に依存することはできるだけ避けましょう。
- 読者は、関数の出力は関数の入力のみに依存することを（通常は）期待します。
- 例: [Team Java](https://github.com/mizuki1029/google-step-tsp/commit/8e9e5d10f86943492347b1a44ee07874b7ec8f76)
- 一般にはコードの再利用のしやすさ、テストのしやすさにもつながります。

---

(高度な?)アルゴリズムは知っておくと実際のプロジェクトで得することがあります。

- N = 16
- [DP の Google Chrome の例](https://chromium-review.googlesource.com/c/chromium/src/+/535493)
- 裏にある考え方:
  - 大きな問題を小さな問題に分割すること
  - 問題の再帰的な構造をとらえること
- （余裕があったら）貪欲に知識をどんどん吸収しましょう。楽しいです。
  - => 存在を知らないとそれを使うべきときも分からないのです。

---

- 今年は Google Chrome / Rendering / DOM Team はインターンを募集予定です。
- [DOM++-Team](https://www.chromium.org/teams/dom-team)
