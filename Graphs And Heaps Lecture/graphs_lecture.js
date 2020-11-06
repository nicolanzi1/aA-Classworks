class GraphNode {
  constructor(val) {
    this.val = val;
    this.neighbors = [];
  }
}

let a = new GraphNode('a');
let b = new GraphNode('b');
let c = new GraphNode('c');
let d = new GraphNode('d');
let e = new GraphNode('e');
let f = new GraphNode('f');
a.neighbors = [e, c, b];
c.neighbors = [b, d];
e.neighbors = [a];
f.neighbors = [e];

let matrix = [
  /*     A       B       C       D       E       F   */
  /*A*/ [true, true, true, false, true, false],
  /*B*/ [false, true, false, false, false, false],
  /*C*/ [false, true, true, true, false, false],
  /*D*/ [false, false, false, true, false, false],
  /*E*/ [true, false, false, false, true, false],
  /*F*/ [false, false, false, false, true, true],
];

let graph = {
  a: ['b', 'c', 'e'],
  b: [],
  c: ['b', 'd'],
  d: [],
  e: ['a'],
  f: ['e'],
};

function depthFirstRecur(node, visited = new Set()) {
  if (visited.has(node.val)) return;

  console.log(node.val);
  visited.add(node.val);

  node.neighbors.forEach((neighbor) => {
    depthFirstRecur(neighbor, visited);
  });
}

// depthFirstRecur(f);

function depthFirstIter(node) {
  let visited = new Set();
  let stack = [node];

  while (stack.length) {
    let node = stack.pop();

    if (visited.has(node.val)) continue;
    console.log(node.val);
    visited.add(node.val);

    stack.push(...node.neighbors);
  }
}

// depthFirstIter(f);

// using Adjacency List representation
function depthFirstRecur1(node, graph, visited = new Set()) {
  if (visited.has(node)) return;

  console.log(node);
  visited.add(node);

  graph[node].forEach((neighbor) => {
    depthFirstRecur(neighbor, graph, visited);
  });
}

// depthFirstRecur1('f', graph);

// refactoring the code
function depthFirst(graph) {
  let visited = new Set();

  for (let node in graph) {
    _depthFirstRecur(node, graph, visited);
  }
}

function _depthFirstRecur(node, graph, visited) {
  if (visited.has(node)) return;

  console.log(node);
  visited.add(node);

  graph[node].forEach((neighbor) => {
    _depthFirstRecur(neighbor, graph, visited);
  });
}

// depthFirst(graph);

let graph1 = {
  h: ['i', 'j'],
  i: [],
  j: ['k'],
  k: [],
  l: ['m'],
  m: [],
};

depthFirst(graph1);
