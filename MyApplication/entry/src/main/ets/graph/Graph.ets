// Graph.ets
export class GraphNode {
  id: number;
  x: number = 0;
  y: number = 0;
  label: string = '';
  color: string = '#fffa5f1d';
  radius: number = 25;

  constructor(id: number, label: string) {
    this.id = id;
    this.label = label;
  }
}

export class GraphEdge {
  source: GraphNode;
  target: GraphNode;
  weight: number;
  directed: boolean = false;
  color: string = '#ff0a30a0';

  constructor(source: GraphNode, target: GraphNode, weight: number = 1, directed: boolean = false) {
    this.source = source;
    this.target = target;
    this.weight = weight;
    this.directed = directed;
  }
}

export class Graph {
  nodes: GraphNode[] = [];
  edges: GraphEdge[] = [];

  addNode(node: GraphNode): void {
    this.nodes.push(node);
  }

  addEdge(edge: GraphEdge): void {
    this.edges.push(edge);
  }

  findNode(id: number): GraphNode | undefined {
    return this.nodes.find(node => node.id === id);
  }
}
// 创建15个节点并命名0
const graph = new Graph();
// 生成15个节点，命名从A到O
const labels = 'ABCDEFGHIJKLMNO'.split('');
for (let i = 0; i < 15; i++) {
  const node = new GraphNode(i, labels[i]);
  graph.addNode(node);
}
// 边的映射关系，将字母对应到数组索引
const letterToIndex = {
  A: 0, B: 1, C: 2, D: 3, E: 4, F: 5, G: 6, H: 7, I: 8, J: 9, K: 10, L: 11, M: 12, N: 13, O: 14
};

// 定义边的连接关系
const edgeConnections = [
  'A到D', 'A到B', 'A到I', 'B到F', 'F到I', 'I到N', 'N到O', 'O到L', 'L到M', 'M到G',
  'G到C', 'C到H', 'H到G', 'H到L', 'E到K', 'E到J', 'B到E', 'C到E', 'J到K', 'K到M',
  'I到D', 'O到J'
];

// 定义边的数据
const edgeData = [
  [0, 3,108], // A到D
  [0, 1,112], // A到B
  [0, 8,88], // A到I
  [1, 5,32], // B到F
  [5, 8,27], // F到I
  [8, 13,26], // I到N
  [13, 14,40], // N到O
  [14, 11,108], // O到L
  [11, 12,34], // L到M
  [12, 6,44], // M到G
  [6, 2,42], // G到C
  [2, 7,43], // C到H
  [7, 6,12], // H到G
  [7, 11,28], // H到L
  [4, 10,40], // E到K
  [4, 9,42], // E到J
  [1, 4,13], // B到E
  [2, 4,20], // C到E
  [9, 10,34], // J到K
  [10, 12,24], // K到M
  [8, 3,50], // I到D
  [14, 9,48]  // O到J
];

edgeData.forEach(([sourceId, targetId]) => {
  const sourceNode = graph.findNode(sourceId);
  const targetNode = graph.findNode(targetId);
  if (sourceNode && targetNode) {
    const edge = new GraphEdge(sourceNode, targetNode);
    graph.addEdge(edge);
  }
});

// 打印图的节点和边信息
console.log('图的节点信息：');
graph.nodes.forEach(node => {
  console.log(`节点ID: ${node.id}, 标签: ${node.label}`);
});

console.log('图的边信息：');
graph.edges.forEach(edge => {
  console.log(`边: ${edge.source.label} -> ${edge.target.label}, 权重: ${edge.weight}`);
});
