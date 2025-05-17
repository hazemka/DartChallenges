import 'package:dart_challenges/linked_list.dart';

void main(List<String> arguments) {
  LinkedList<int> linkedList = LinkedList<int>();
  linkedList.push(4);
  linkedList.push(3);
  linkedList.push(3);
  linkedList.push(3);
  linkedList.push(2);
  linkedList.push(1);
  print('Linked List $linkedList');
  // Challenge 1: Print in Reverse
  printInReverse(linkedList);
  // Challenge 2: Find the Middle Node
  print('Middle Node: ${findTheMiddleNode(linkedList)}');
  // Challenge 3: Reverse a Linked List
  print('Reversed Linked List:');
  print(reverseToNewList(linkedList));
  // Challenge 4: Remove All Occurrences
  print('Remove All Occurrences');
  print(removeAllOccurrences(linkedList));
}

void printInReverse<E>(LinkedList<E> linkedList){
  List<E> stack = [];
  Node? current = linkedList.head;
  while(current != null){
    stack.add(current.value);
    current = current.next;
  }
  print('Linked List with reverse:');
  while(stack.isNotEmpty){
    print(stack.removeLast());
  }
}

E findTheMiddleNode<E>(LinkedList<E> linkedList){
  int count = 0;
  Node? current = linkedList.head;
  while(current != null){
    count++;
    current = current.next;
  }
  count = count ~/ 2;
  return linkedList.nodeAt(count)!.value;
}

LinkedList<E> reverseToNewList<E>(LinkedList<E> linkedList) {
  LinkedList<E> reversed = LinkedList<E>();
  Node<E>? current = linkedList.head;

  while (current != null) {
    Node<E> newNode = Node<E>(value: current.value);
    newNode.next = reversed.head;
    reversed.head = newNode;
    current = current.next;
  }
  return reversed;
}


LinkedList<E> removeAllOccurrences<E>(LinkedList<E> linkedList) {
  Map<E, int> counts = {};
  Node<E>? current = linkedList.head;
  while (current != null) {
    counts[current.value] = (counts[current.value] ?? 0) + 1;
    current = current.next;
  }

  LinkedList<E> newList = LinkedList<E>();
  current = linkedList.head;
  while (current != null) {
    if (counts[current.value] == 1) {
      newList.add(current.value);
    }
    current = current.next;
  }

  return newList;
}