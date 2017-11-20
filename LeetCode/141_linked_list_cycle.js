// Given a linked list, determine if it has a cycle in it.
//
// Follow up:
// Can you solve it without using extra space?
/**
 * Definition for singly-linked list.
 * function ListNode(val) {
 *     this.val = val;
 *     this.next = null;
 * }
 */

/**
 * @param {ListNode} head
 * @return {boolean}
 */
var hasCycle = function(head) {
    if (head === null) {
        return false;
    }
    let first = head;
    let second = head.next;
    if (second === null) {
        return false;
    }
    second = second.next;
    if (second === null) {
        return false;
    }

    while (second) {
        if (first === second) {
            return true;
        }
        if (second.next === null || second.next.next === null) {
            return false;
        }
        first = first.next;
        second = second.next.next;
    }
    return false;
};
