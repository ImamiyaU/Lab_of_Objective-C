//
//  main.m
//  1-CommandLineTool_for_OSX
//
//  Created by 碓氷 美奈子 on 2013/07/06.
//  Copyright (c) 2013年 Imamiya-project. All rights reserved.
//

#import <Foundation/Foundation.h>

NSString* input();

int main(int argc, const char * argv[])
{
    
    // メモ
    // ひっかかったwarning
    // ・Implicit declaration of function 'NSlog' is invalid in c99
    //   →NSlogなんてc99の文法にないよ。NSlogじゃなくて、NSLog。
    //    うっかり書き間違えて、しばらく何がいけないのかわからなくハマった。
    //    大文字小文字、めんどくさ。
    
    
    // リスト１
    // @autoreleasepool → オートリリースプール（メモリ管理の仕組み）
    @autoreleasepool {
        
        // Type Objective-C
        NSLog(@"Type Objective-C : ");
        NSLog(@"Hello, World!");
        NSLog(@"Type %@ : %@", @"Objective-C", @"Hello, World!");
        
        // Type C
        printf("Type C : ");
        printf("Hello, World!\n");
        // ¥nでは改行されない。改行したいなら\n。
        // \は、[option]+[¥]
        printf("Type %s : ¥n%s\n" , "C", "Hello, World!");
        
        // 長い文字列も改行して記述することができる。（可読性向上）
        NSString *test = @"ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        "1234567890";
        /* ↓こういう改行のしかたはビルドエラーになる。
         NSString *test = @"ABCDEFGHIJKLMNOPQRSTUVWXYZ
         1234567890";
         */
        
        NSLog(@"%@\n", test);
    }
    
    // リスト２
    @autoreleasepool {
        NSLog(@"%@", @"your name?");
        NSString* yourname = input();
        NSLog(@"Hello,  %@!", yourname);
    }
    
    // リスト３
    @autoreleasepool{
        NSString *s1 = @"hello                              ";
        NSLog(@"s1(NSString) : %@\n", s1);
        
        // 文字列の長さを求める
        // ”hello”の後ろに余計な空白が含まれてくるため、実際の文字数である5文字より大きい値が帰ってくる。
        NSLog(@"s1(Length) : %ld", [s1 length]);
        
        // 文字列の後ろについてくる空白を除去
        NSString *s2 = [s1 stringByTrimmingCharactersInSet:
                        [NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        // 余分な空白を除去したため、期待値通りの5が出力される。
        NSLog(@"s2(Length) : %ld", [s2 length]);
        
        NSString *s3 = @"100";
        // 文字列を整数に変換
        int i = [s3 intValue];
        NSLog(@"s3(intValue) : %d",i);
    }
    
    return 0;
}

// リスト２で使用
NSString* input() {
    // C言語の文字列
    char str[256];
    
    // C言語の関数
    fgets(str, 256, stdin);
    
    // C言語の文字列をNSStringのオブジェクトに変換
    NSString* result = [NSString stringWithUTF8String:str];
    
    // ここの説明は次回らしい。
    // わかったら後で解説を追記する。
    return [result stringByTrimmingCharactersInSet:
            [NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

