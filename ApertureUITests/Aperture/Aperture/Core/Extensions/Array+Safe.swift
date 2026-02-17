// Array+Safe.swift
// Safe array subscript to avoid index out of bounds crashes

import Foundation

extension Array {
  subscript(safe index: Index) -> Element? {
    indices.contains(index) ? self[index] : nil
  }
}
