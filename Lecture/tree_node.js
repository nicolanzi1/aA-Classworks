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

function inOrderPrint(root) {
  if (root === null) return;

  inOrderPrint(root.left);
  console.log(root.val);
  inOrderPrint(root.right);
}

function preOrderPrint(root) {
  if (!root) return;

  console.log(root.val);
  preOrderPrint(root.left);
  preOrderPrint(root.right);
}

function postOrderPrint(root) {
  if (!root) return;

  postOrderPrint(root.left);
  postOrderPrint(root.right);
  console.log(root.val);
}

inOrderPrint(a);
console.log(' ');
preOrderPrint(a);
console.log(' ');
postOrderPrint(a);
