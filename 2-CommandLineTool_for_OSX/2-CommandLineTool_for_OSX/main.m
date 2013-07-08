//
//  main.m
//  2-CommandLineTool_for_OSX
//
//  Created by 碓氷 美奈子 on 2013/07/06.
//  Copyright (c) 2013年 Imamiya-project. All rights reserved.
//

#import <Foundation/Foundation.h>

NSString* input();

int main(int argc, const char * argv[])
{

    // リスト1
    @autoreleasepool {
        NSLog(@"===== List 1 =====\n");

        // クラス        インスタンス
        // ボタン ──┬──→ ボタン
        //         ├──→ ボタン
        //         └──→ ボタン
        
        // ジョンという犬へ命令する
        // クラス      : 犬
        // インスタンス : ジョン
        
        // ジョンへ、100メートル走れ！
        // ジョンへ、吠えろ！
        // └─┬─┘   └──────┬──────┘
        //   ↓            ↓
        // レシーバ      メソッド
        
        // ジョンへ、100メートルゆっくりと走れ！
        // java        → ジョン.走れ(100m, ゆっくりと)
        // Objective-C → [ジョン 走れ:100m どのように:ゆっくりと]
        
        // NSString → クラス
        // alloc    → クラスメソッド
        NSString *str1 = [[NSString alloc] init];
        
        str1 = @"hello";
        
        // str → インスタンス
        // 下記は全部インスタンスメソッド
        //     length
        //     characterAtIndex:4
        //     stringByReplacingOccurrencesOfString:@"11" withString:@"LL"
        
        // "hello" 文字列の長さ
        NSLog(@"%ld", [str1 length]);
        
        // "hello" ○番目の文字列:4番目
        NSLog(@"%c", [str1 characterAtIndex:4]);
        
        // "hello" この文字列を置換しろ:"ll" この文字列に:"LL"
        // stringByReplacingOccurrencesOfString:@"11" withString:@"LL"
        NSLog(@"%@", [str1 stringByReplacingOccurrencesOfString:@"ll" withString:@"LL"]);
        
    }
    
    // リスト2
    @autoreleasepool {
        NSLog(@"===== List 2 =====\n");

        // [レシーバ　メソッド]が２重になっているパターン
        //    NSStringクラス というレシーバに対して、 allocメソッド を実行
        //    Objective-Cでは、インスタンスだけでなく、クラスに対してもメソッドを実行することができる。
        //
        //              NSStringのインスタンスを作成【クラスメソッド】
        //                     ↑
        //              ┌──────┴───────┐
        NSString *s1 = [[NSString alloc] init];
        //              └─────────┬──────────┘
        //                        ↓
        //              生成されたインスタンスに対して initメソッド（初期化）を実行。【インスタンスメソッド】
        // 文字列クラスNSStringのクラスメソッドの例 ） stringWithString: , string
        //
        // 上記でallocでメモリー内にインスタンス領域を生成し、変数を初期化したが、文字列はセットされていないので、
        // インスタンスに"hello"という文字列をセットする。
        // @"hello"が新たなインスタンスとなるため、
        // NSString *s1 = [[NSString alloc] init] で行った代入は無駄になる。（リーク（生成したが使用できないインスタンス））
        // @autoreleasepoolで、こういうインスタンスを自動解放する。
        s1 = @"hello";
        
        // allocメソッドはNSStringのメソッドではない。NSObjectのメソッド。
        // s2~s6 の記述のような特殊なメソッドを持たない一般的なクラスは内部ではs1のようにallocが使用されている。
        
        // s1と同じ。
        // Objective-Cでは、先頭に「@」をつけることで、その文字列のインスタンスを生成する。
        NSString *s2 = @"hello";
        
        // s1と同じ。
        // allocとinitを同時に実行する書き方と思えば良い
        NSString *s3 = [NSString string];
        s3 = @"hello";
        
        // s2のコピーとなるインスタンスを作成。
        // s2とs4はどちらも"hello"だが、文字列が保持されるメモリー領域は異なる。
        NSString *s4 = [NSString stringWithString:s2];
        // s4が「hello」かどうか判断する場合は下記のように書く。
        //     if([s4 isEqualToString:@"hello"])
        // 下記の書き方はNG。（s4と@”hello”は別のインスタンスだから。）
        //     if (s4 == @"hello")
        
        // A
        char s[] = "hello";
        NSString *s5 = [NSString stringWithCString:s  encoding:NSUTF8StringEncoding];

        // A
        NSString *s6 = [NSString stringWithFormat:@"%@" , @"hello"];
        
        // A
        NSString *s7[] = {@"hello" , @"world"};
 
        // 未使用だとWarningが出て気持ち悪いので、とりあえず出力だけしておく。
        NSLog(@"s1 : %@",s1);
        NSLog(@"s2 : %@",s2);
        NSLog(@"s3 : %@",s3);
        NSLog(@"s4 : %@",s4);
        NSLog(@"s5 : %@",s5);
        NSLog(@"s6 : %@",s6);
        NSLog(@"s7 : %@",*s7);

    }
    
    // リスト3
    @autoreleasepool {
        NSLog(@"===== List 3 =====\n");
        NSLog(@"TYPE NUMBER : ");
        NSString *str3 = input();
        
        // 文字列を数値に変換してnumに代入
        int num = [ str3 intValue];
        int total3 = 0;
        for (int i = 0; i <= num; i++){
            total3 += i;
            NSLog(@"total : %d , i : %d", total3, i);
        }
        
        //                                 ←変換←
        //    文字列┌─────────────────────────────────────────────────────────┐数値
        //         ↓                                                    ┌────┴────┐
        NSString *res = [NSString stringWithFormat:@"%d までの合計 : %d", num, total3];
        NSLog(@"%@", res);
    }

    // リスト4
    @autoreleasepool {
        NSLog(@"===== List 4 =====\n");
        
        // NSArray : 「配列」(array)のクラス。
        //            いろんなクラスの多数のインスタンスを格納し、一括で管理できる。
        // NSArrayのインスタンスは、下記のようにクラスメソッド「array」を利用して作っている。
        // NSArray *array = [NSArray array];
        NSArray *a1 = @[@100, @3.14, @"hello"];
        NSArray *a2 = [NSArray arrayWithArray:a1];
        NSArray *a3 = [NSArray arrayWithObjects:@100, @3.14, @"hello", nil];
        NSLog(@"a1 : %@", a1);
        NSLog(@"a2 : %@", a2);
        NSLog(@"a3 : %@", a3);
    }
    
    // リスト5
    @autoreleasepool {
        NSLog(@"===== List 5 =====\n");
        
        NSArray *array = [NSArray array];
        
        BOOL end_flg = YES;
        
        while (end_flg) {
            NSLog(@"INPUT : ");
            NSString *str5 = input();
            
            // 文字列がendかどうか判別
            if ([str5 compare:@"end"] == NSOrderedSame){
                // endならBOOL型のend_flgをNOにして、whileループを終了
                end_flg = NO;
            }else{
                // 入力された文字列を配列に追加
                // arrayByAddingObject:メソッドは、インスタンスそのものにデータを追加するのではなく、
                // データを追加したインスタンスを新たに作成している。
                // NSArrayのインスタンスに一度でもデータを設定すると、もうデータの追加や削除などの変更はできない。
                array = [array arrayByAddingObject:str5];
                // ↓     　 ↓                        ↓
                // 新しい = これまでのインスタンス   +  追加するデータ
                // インスタンス
                
                // インスタンスそのものを編集したい場合は「NSArray」ではなく、「NSMutableArray」を使用する。
                // NSMutableArray : NSArrayを継承したクラス。インスタンスを自由に変更可能。
                //                  mutableは「変わりやすい」の意。
            }
        }
        
        int total5 = 0;
        
        // countメソッドを使用し、arrayに格納されたデータの数を取得。
        // NSUInteger : Objective-Cの「符号無し整数」の型。
        //              クラスではなく、単なる型なので、ポインタ変数ではなく、普通の変数で宣言する。
        NSUInteger n = [array count];
        
        for (int i = 0; i < n; i++){
            // objectAtIndex:メソッドで、格納されていつデータを１つずつ取り出し、
            // intValueメソッドで整数に変換して、合計と平均を計算する。
            // [array objectAtIndex:i] は array[i] と記述してもOK。
            total5 += [[array objectAtIndex:i] intValue];
        }
        NSLog(@"TOTAL : %d , AVE. : %d", total5, (int)(total5 / n));
    }
    return 0;
}

// リスト3、リスト5で使用
// 1-CommandLineTool_for_OSX のリスト2で使用したものと同じ。
NSString* input() {
    // C言語の文字列
    char str[256];
    
    // C言語の関数
    // ユーザーからの文字列の入力を配列strで受け取る。
    fgets(str, 256, stdin);
    
    // NSStringのクラスメソッド「stringWithUTF8String」を使用して、
    // C言語の文字列をObjective-Cの文字列（NSStringのインスタンス）を生成。
    NSString* result = [NSString stringWithUTF8String:str];
    
    // 文字列の前後に空白や改行がある場合は除去する
    //         引数に指定した文字列を除去することができる  文字の種類を表現するためのクラス  空白と改行文字を返すメソッド
    //                             ↑                      ↑                         ↑
    //             ┌───────────────┴─────────────┐ ┌──────┴──────┐┌─────────────────┴──────────────┐
    return [result stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}


