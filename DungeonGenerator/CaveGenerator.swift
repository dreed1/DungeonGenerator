//
//  CaveGenerator.swift
//  DungeonGenerator
//
//  Created by Dan Reed on 9/5/15.
//  Copyright (c) 2015 Dan Reed. All rights reserved.
//


public let Space = 0
public let Wall = 1


import UIKit

class CaveGenerator: NSObject {
  var mapWidth: Int = 80
  var mapHeight: Int = 80
  var percentageThatAreWalls: UInt32 = 43
  
  //number of rounds that the map'll be generated
  var mapGenerations = 5
  
  var mapRepresentation:[[Int]]!
  
  //MARK: Init methods
  
  /**
  make a dummy map and print it to console
  */
  func genDemoMap() {
    self.generateProceduralCave(100, height: 100, percentageOfWalls: 48, numberOfGenerations: 9)
  }
  
  func generateProceduralCave(width: Int, height: Int, percentageOfWalls: UInt32, numberOfGenerations: Int) {
    self.mapWidth = width
    self.mapHeight = height
    self.percentageThatAreWalls = percentageOfWalls
    self.mapGenerations = numberOfGenerations
    
    self.fillMapRandomly()
    println("THE ORIGINAL:")
    self.printMap()
    self.generateAllMapGenerations()
    println("THE FINISHED PRODUCT:")
    self.printMap()
  }
  
  /**
  fill the map randomly! :)
  */
  func fillMapRandomly() {
    self.initBlankMap()
    for row in 0..<mapWidth {
      for column in 0..<mapHeight {
        var thisSpot = self.fillSpot(row, column: column)
        self.mapRepresentation[column][row] = thisSpot
      }
    }
  }
  
  /**
  init a blank map, the size of whatever's specified in the mapHeight/width params
  
  :returns: nothing
  */
  func initBlankMap() {
    self.mapRepresentation = [[Int]](
      count: self.mapHeight,
      repeatedValue: [Int](count: self.mapWidth, repeatedValue: 0)
    )
  }
  
  /**
  fill a location with a wall or a space
  
  :param: row    the y coord
  :param: column the x coord
  
  :returns: the value for the location, currently 0 is space and 1 is wall
  */
  func fillSpot(row: Int, column: Int) -> Int {
    if self.isBorderWall(row, column: column) {
      return Wall
    }
    
    if row == self.mapHeight/2 {
				return Space
    }
    
    return self.isASpace() ? Space : Wall
  }
  
  /**
  returns based on random dumb luck whether the space is a space or a wall
  
  :returns: the result, truw if the location should be a space
  */
  func isASpace() -> Bool {
    if arc4random() % UInt32(100) >= self.percentageThatAreWalls {
      return true
    }
    
    return false
  }
  
  /**
  denotes whether the location is a wall on the border of the map
  
  :param: row    the row
  :param: column the column
  
  :returns: the result, is it a border wall?
  */
  func isBorderWall(row: Int, column: Int) -> Bool {
    var isOnAVerticalEdge = row == 0 || row == self.mapWidth - 1
    var isOnAHorizontalEdge = column == 0 || column == self.mapHeight - 1
    
    if isOnAHorizontalEdge || isOnAVerticalEdge {
      return true
    }
    return false
  }
  
  //MARK: Cell Automata/ wall gen logic
  
  /**
  generates all generations of the map, like its supposed to
  */
  func generateAllMapGenerations() {
    for gen in 0...self.mapGenerations {
      self.generateMapGeneration()
    }
  }
  
  /**
  does one round of map generation
  */
  func generateMapGeneration() {
   // var mapCopy = self.mapRepresentation
    for row in 0..<self.mapWidth {
      for column in 0..<self.mapHeight {
        self.mapRepresentation[column][row] = self.shouldBeAWall(row, column: column) ? Wall : Space
      }
    }
   // self.mapRepresentation = mapCopy
  }
  
  /**
  check if a location should be a wall based on various conditions
  
  1. if its a border, it's a wall.
  2. if it's not a wall but there's already 5 or more walls around it... it's a wall.
  3. if it's already a wall and it's touching 4 or more walls, you guessed it-- wall.
  
  :param: row    the y coord, which row is it in?
  :param: column the x coord
  
  :returns: whether or not this location should now be a wall
  */
  func shouldBeAWall(row: Int, column: Int) -> Bool {
    if self.isBorderWall(row, column: column) {
      return true
    }
    
    var willBeAWall = false
    var neighboringWalls = self.countNeighboringWalls(row, column: column)
    var isWallAlready = self.mapRepresentation[column][row] == Wall
    
    if isWallAlready {
      if neighboringWalls >= 4 {
        willBeAWall = true
      }
    } else {
      if neighboringWalls >= 5 {
        willBeAWall = true
      }
    }
    return willBeAWall
  }
  
  /**
  counts the number of walls neighboring a given x,y location
  
  dont use this on something that's a wall... it will crash
  
  :param: row    the row of the cell we're talking about
  :param: column the column of the cell
  */
  func countNeighboringWalls(row: Int, column: Int) -> Int {
    var count = 0
    
    for r in row-1...row+1 {
      for c in column-1...column+1 {
        if !(r == row && c == column) {
          count += self.mapRepresentation[c][r]
        }
      }
    }
    return count
  }
  
  //MARK: Draw methods
  
  /**
  log the map to the console
  */
  func printMap() {
    var numberOfSpaces = 0
    var numberOfWalls = 0
    let key = [
      Space: " ",
      Wall: "X"
    ]
    for row in 0..<mapWidth {
      var rowString = ""
      for column in 0..<mapHeight {
        if self.mapRepresentation[column][row] == Space {
          numberOfSpaces++
        } else {
          numberOfWalls++
        }
        rowString = rowString.stringByAppendingString("\(key[self.mapRepresentation[column][row]]!)")
      }
      println(rowString)
    }
    println("There are \(numberOfSpaces) spaces and \(numberOfWalls) walls")
  }
}