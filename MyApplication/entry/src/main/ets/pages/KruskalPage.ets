// Second.ets
import { BusinessError } from '@kit.BasicServicesKit';
import { Graph, GraphNode, GraphEdge } from '../graph/Graph';
@Entry
@Component
struct KruskalPage {
  @State graph: Graph = new Graph();
  @State selectedNode: GraphNode | null = null;
  @State isDirected: boolean = false;
  @State showWeights: boolean = true;

  // Canvas 相关状态
  @State canvasWidth: number = 800;
  @State canvasHeight: number = 600;

  aboutToAppear() {
    this.initSampleGraph();
  }

  initSampleGraph() {
    // 创建节点
    const node1 = new GraphNode(1, 'A');
    const node2 = new GraphNode(2, 'B');
    const node3 = new GraphNode(3, 'C');
    const node4 = new GraphNode(4, 'D');
    const node5 = new GraphNode(5, 'E');

    this.graph.addNode(node1);
    this.graph.addNode(node2);
    this.graph.addNode(node3);
    this.graph.addNode(node4);
    this.graph.addNode(node5);

    // 创建边
    this.graph.addEdge(new GraphEdge(node1, node2, 5, this.isDirected));
    this.graph.addEdge(new GraphEdge(node1, node3, 3, this.isDirected));
    this.graph.addEdge(new GraphEdge(node2, node4, 2, this.isDirected));
    this.graph.addEdge(new GraphEdge(node3, node4, 1, this.isDirected));
    this.graph.addEdge(new GraphEdge(node4, node5, 4, this.isDirected));
    this.graph.addEdge(new GraphEdge(node2, node5, 6, this.isDirected));

    // 自动布局
    this.graph.autoLayout(this.canvasWidth, this.canvasHeight);
  }

  @State message: string = 'Kruskal算法';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20 })
        Button() {
          Text('Back')
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .margin({
          top: 20
        })
        .backgroundColor('#0D9FFB')
        .width('40%')
        .height('5%')
        .onClick(() => {
          console.info(`Succeeded in clicking the 'Back' button.`)
          // 获取UIContext
          let uiContext: UIContext = this.getUIContext();
          let router = uiContext.getRouter();
          try {
            // 返回第一页
            router.back()
            console.info('Succeeded in returning to the first page.')
          } catch (err) {
            let code = (err as BusinessError).code;
            let message = (err as BusinessError).message;
            console.error(`Failed to return to the first page. Code is ${code}, message is ${message}`)
          }
        })
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Start)
    }
    .height('100%')
  }

}