class MaxHeap {
  constructor() {
    this.array = [null];
  }

  getParent(idx) {
    return Math.floor(idx / 2);
  }

  getLeftChild(idx) {
    return idx * 2;
  }

  getRightChild(idx) {
    return idx * 2 + 1;
  }

  insert(val) {
    // add the new node to the bottom level, far-left
    this.array.push(val);

    // then, sift that value up the heap to restore heap property
    this.siftUp(this.array.length - 1);
  }

  siftUp(idx) {
    // if the node is already at the root, there's no further we can sift up
    if (idx === 1) return;

    let parentIdx = this.getParent(idx);

    // if the node is bigger than it's parent, we are breaking heap property...
    if (this.array[parentIdx] < this.array[idx]) {
      // so swap the node with it's parent
      [this.array[parentIdx], this.array[idx]] = [
        this.array[idx],
        this.array[parentIdx],
      ];

      // and continue to sift it up recursively
      this.siftUp(parentIdx);
    }
  }

  deleteMax() {
    // recall that we have an empty position at the very front of the array,
    // so an array length of 2 means there is only 1 item in the heap

    // if there is only 1 element in the heap, simply remove it
    if (this.array.length === 2) return this.array.pop();

    // if there are no elements in the heap, do nothing
    if (this.array.length === 1) return null;

    // otherwise remove the last element and make it the root at the front of the array
    let max = this.array[1];
    this.array[1] = this.array.pop();

    // then, sift the new root down to restore heap property
    this.siftDown(1);
    return max;
  }

  siftDown(idx) {
    let ary = this.array;
    let leftIdx = this.getLeftChild(idx);
    let rightIdx = this.getRightChild(idx);
    let leftVal = ary[leftIdx];
    let rightVal = ary[rightIdx];

    // if the node is missing children, consider the missing children as the value -Infinity
    // this allows the node to keep heap property, since any value is greater than -Infinity
    // this will also give us children values to compare later, undefined should not be used for comparison**
    if (leftVal === undefined) leftVal = -Infinity;
    if (rightVal === undefined) rightVal = -Infinity;

    if (ary[idx] > leftVal && ary[idx] > rightVal) return;

    let swapIdx;
    if (leftVal < rightVal) {
      swapIdx = rightIdx;
    } else {
      swapIdx = leftIdx;
    }

    [ary[idx], ary[swapIdx]] = [ary[swapIdx], ary[idx]];
    this.siftDown(swapIdx);
  }
}

let heap = new MaxHeap();
heap.insert(42);
heap.insert(32);
heap.insert(24);
heap.insert(100);
heap.insert(50);
heap.insert(27);
console.log(heap.array);
console.log(heap.deleteMax());
console.log(heap.array);
