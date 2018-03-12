// # Write a program to find the node at which the intersection of two singly linked lists begins.
// #
// #
// # For example, the following two linked lists:
// #
// # A:          a1 → a2
// #                    ↘
// #                      c1 → c2 → c3
// #                    ↗
// # B:     b1 → b2 → b3
// # begin to intersect at node c1.
// #
// #
// # Notes:
// #
// # If the two linked lists have no intersection at all, return null.
// # The linked lists must retain their original structure after the function returns.
// # You may assume there are no cycles anywhere in the entire linked structure.
// # Your code should preferably run in O(n) time and use only O(1) memory.

 // * Definition for singly-linked list.
 function ListNode(val) {
   this.val = val;
   this.next = null;
}


/**
 * @param {ListNode} headA
 * @param {ListNode} headB
 * @return {ListNode}
 */
 /**
  * Definition for singly-linked list.
  * function ListNode(val) {
  *     this.val = val;
  *     this.next = null;
  * }
  */

 var getIntersectionNode = function(headA, headB) {
     let reversedALast = null;
     let reversedBLast = null;

     let currentA = headA;
     let currentB = headB;
     let newA;
     let newB;

     while (currentA || currentB) {
         if (currentA) {
             newA = new ListNode(currentA.val);
             newA.next = reversedALast;
             reversedALast = newA;
             currentA = currentA.next;
         }
         if (currentB) {
             newB = new ListNode(currentB.val);
             newB.next = reversedBLast;
             reversedBLast = newB;
             currentB = currentB.next;
         }
     }
     let lastIntersect = null;
     while (newA && newB && newA.val === newB.val) {
         lastIntersect = newA;
         newA = newA.next;
         newB = newB.next;

     }
     return lastIntersect;
 };

a = new ListNode(1);
b = new ListNode(2);
c = new ListNode(3);
d = new ListNode(4);
e = new ListNode(5);
f = new ListNode(6);
g = new ListNode(7);
h = new ListNode(8);

a.next = b;
b.next = c;

d.next = e;
e.next = f;

c.next = g;
f.next = g;

g.next = h;

console.log(getIntersectionNode(a, d));
