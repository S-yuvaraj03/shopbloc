import 'package:shopbloc/exportpage.dart';

void main() {
  runApp(
    MaterialApp( 
      debugShowCheckedModeBanner: false,
      home: OrdersScreen(),
      )
  );
}

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Screen"),
        backgroundColor: Colors.green.shade300,
      ),
      body:  Column(
        children: [
          Text("Available Orders", style: TextStyle( color: Colors.green.shade300,),),
          // Open orders section
          BlocProvider(
            create: (context) => OpenOrdersBloc()..add(FetchOrdersEvent()),
            child: BlocBuilder<OpenOrdersBloc, OrderState>(
              builder: (context, state) {
                if (state is LoadingState) {
                  return CircularProgressIndicator();
                } else if (state is LoadedState) {
                  final orders = state.orders;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: orders.length,
                    itemBuilder: (context, index) {
                      final order = orders[index];
                      return ListTile(
                        title: Text(order.title),
                        subtitle: Text(order.description),
                        trailing: Text('\$${order.price}'),
                      );
                    },
                  );
                }
                return Container();
              },
            ),
          ),
          const Text("Closed Orders", style: TextStyle( color: Colors.red,),),
          // Closed orders section
          BlocProvider(
            create: (context) => ClosedOrdersBloc()..add(FetchOrdersEvent()),
            child: BlocBuilder<ClosedOrdersBloc, OrderState>(
              builder: (context, state) {
                if (state is LoadingState) {
                  return CircularProgressIndicator();
                } else if (state is LoadedState) {
                  final orders = state.orders;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: orders.length,
                    itemBuilder: (context, index) {
                      final order = orders[index];
                      return Container(
                        color: Colors.black12,
                        child: ListTile(
                          title: Text(order.title),
                          subtitle: Text(order.description),
                          trailing: Text('\$${order.price}'),
                        ),
                      );
                    },
                  );
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
