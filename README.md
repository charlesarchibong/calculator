Center(child: Text('HISTORY', style: TextStyle(fontWeight: FontWeight.bold,),)),
           Expanded(
             child: Container(
               decoration: BoxDecoration(
                   color: Colors.grey[300],
                 borderRadius: BorderRadius.circular(20),
               ),
               child: ListView.builder(
                 itemCount: widget.history.length,
                   itemBuilder: (context, index){
                   return ListTile(title: Text('${widget.history[index]}'));
                   }
               ),
             ),
           ),