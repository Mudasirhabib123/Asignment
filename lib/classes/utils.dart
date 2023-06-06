class Utils {
  updateDummyData(int index, bool value, List dummyData) {
    dummyData[index]['value'] = value;
    int startIndex = index; // setting initial value
    // list that contains series of all parent regarding to clicked checkbox
    if (dummyData[index]['hasChild'] as bool) {
      // handling click for parent checkbox
      evaluateTopToBottom(dummyData, startIndex, index, value);
      evaluateBottomToTop(dummyData, startIndex, index, value);
    } else {
      evaluateBottomToTop(dummyData, startIndex, index, value);
    }
    return dummyData;
  }
}

evaluateTopToBottom(dummyData, startIndex, index, value) {
  List<String> parents = [dummyData[index]['title']];
  // Iteration starts from checkbox clicked index to last index
  for (startIndex; startIndex < dummyData.length; startIndex++) {
    // started loop from clicked index to last index
    if (dummyData[startIndex]['key'] > dummyData[index]['key']) {
      if (dummyData[startIndex]['hasChild']) {
        if ((parents.contains(dummyData[startIndex]['parent']))) {
          parents.add(dummyData[startIndex]
              ['title']); // it adds current child as parent
        } else {
          // here loop will breaked to stop changing result for greater keys
          break;
        }
      }
      dummyData[startIndex]['value'] = value;
    }
  }
}

evaluateBottomToTop(dummyData, startIndex, index, value) {
  List<String> parents = [dummyData[index]['parent']];
  // it gives the index of last index of child list
  for (startIndex; startIndex < dummyData.length; startIndex++) {
    if (dummyData[startIndex]['hasChild']) {
      break;
    }
  }
  startIndex--;
  bool allEqual = true;
  // evaluation starts from checkbox clicked index to zero index

  for (startIndex; startIndex >= 0; startIndex--) {
    if (dummyData[startIndex]['hasChild'] &&
        parents.contains(dummyData[startIndex]['title'])) {
      parents.add(dummyData[startIndex]
          ['parent']); // to make reference between parent and child
      if (allEqual) {
        dummyData[startIndex]['value'] = value;
      } else {
        dummyData[startIndex]['value'] =
            allEqual; //if all equal is false then asign false to parent checkbox
      }
      // break;
    }
    if (dummyData[startIndex]['value'] != value) {
      // to check wether all the childs has same value or not
      allEqual = false;
      // break;
    }
  }
}
