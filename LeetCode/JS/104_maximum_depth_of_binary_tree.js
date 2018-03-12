var maxDepth = function(root) {
    let maxDepth = 0;
    if (root == null) {
        return maxDepth;
    }

    const nodeStack = [[root, 1]];

    while (nodeStack.length > 0) {
        let [currNode, currDepth] = nodeStack.pop();

        if (currDepth > maxDepth) {
            maxDepth = currDepth;
        }

        if (currNode.left) {
            nodeStack.push([currNode.left, currDepth + 1]);
        }

        if (currNode.right) {
            nodeStack.push([currNode.right, currDepth + 1]);
        }
    }

    return maxDepth;
};
