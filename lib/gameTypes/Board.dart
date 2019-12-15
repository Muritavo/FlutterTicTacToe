class Board {
  List state;
  List getState() {
    return this.state;
  }

  _initDimension(List list, dimensionSize, remaining) {
    if (remaining == 0) {
      return list;
    } else {
      return list.map((item) => _initDimension(List(dimensionSize), dimensionSize, remaining - 1)).toList();
    }
  }

  _initBoard(dimension, size) {
    this.state = _initDimension(List<List>(size), size, dimension - 1);
  }

  Board() {
    this._initBoard(3, 3);
  }

  Board.fromDimensions(dimension, size) {
    this._initBoard(dimension, size);
  }

  bool mark(symbol, List where) {
    var cell = this.state[where.first];
    for (var index in where.getRange(1, where.length - 1)) {
      cell = cell[where[index]];
    }
    if (cell[where.last] != null) {
      throw new Exception("There is already a mark at the current position");
    }
    cell[where.last] = symbol;
  }
}