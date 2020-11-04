class TreeNode {
  constructor(val) {
    this.val = val;
    this.left = null;
    this.right = null;
  }
}

let a = new TreeNode('a');
let b = new TreeNode('b');
let c = new TreeNode('c');
let d = new TreeNode('d');
let e = new TreeNode('e');
let f = new TreeNode('f');

a.left = b;
a.right = c;
b.left = d;
b.right = e;
c.right = f;

function depthFirst(root) {
  let stack = [root];

  while (stack.length) {
    let node = stack.pop();

    console.log(node.val);
    if (node.right) stack.push(node.right);
    if (node.left) stack.push(node.left);
  }
}

function depthFirstRecur(root) {
  if (!root) return;

  console.log(root.val);
  depthFirst(root.left);
  depthFirst(root.right);
}

// depthFirst(a);
// depthFirstRecur(a);

function breadthFirst(root) {
  let queue = [root];

  while (queue.length) {
    let node = queue.shift();

    console.log(node.val);
    if (node.left) queue.push(node.left);
    if (node.right) queue.push(node.right);
  }
}

breadthFirst(a);
