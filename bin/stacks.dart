void main(){

  // Challenge 1: Reverse a List
  const list = [1,2,3,4,5,6];
  printListInReverse(list);

  // Challenge 2: Balance the Parentheses
  print(isStringBalance('(1+3) + 4 )'));
}

void printListInReverse<T>(List<T> list){
  List<T> stack = [];
  print('List In Reverse:');
  for(var item in list){
    stack.add(item);
  }

  while(stack.isNotEmpty){
    print(stack.removeLast());
  }
}

bool isStringBalance(String input){
  List<String> stack = [];
  print('Check string $input balance:');
  for(int i = 0; i < input.length ; i++){
    String char = input[i];

    if(char == '('){
      stack.add(char);
    }else if(char == ')'){
      if(stack.isEmpty) return false;
      stack.removeLast();
    }
  }

  return stack.isEmpty;
}
