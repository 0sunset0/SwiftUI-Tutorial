//
//  GameState.swift
//  06. ScoreKeeper
//
//  Created by 노을 on 4/11/26.
//
/**
 struct여러 인스턴스를 가질 수 있는 객체와는 달리, 열거형에는 정의에 명시된 값만 존재합니다.
 게임 상태처럼 몇 가지 값으로 제한된 것을 모델링하는 데 매우 유용한 방법입니다.
 */
enum GameState {
    case setup
    case playing
    case gameOver
}
