// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

library StringUtils {
    function compare(string memory _a, string memory _b) internal pure returns (int) {
        bytes memory a = bytes(_a);
        bytes memory b = bytes(_b);
        uint minLength = a.length;
        if (b.length < minLength) minLength = b.length;
        for (uint i = 0; i < minLength; i++)
            if (a[i] < b[i]) return -1;
            else if (a[i] > b[i]) return 1;

        if (a.length < b.length) return -1;
        else if (a.length > b.length) return 1;
        else return 0;
    }

    function equal(string memory _a, string memory _b) internal pure returns (bool) {
        return compare(_a, _b) == 0;
    }

    function indexOf(string memory _haystack, string memory _needle) internal pure returns (int) {
        bytes memory h = bytes(_haystack);
        bytes memory n = bytes(_needle);
        if (h.length < 1 || n.length < 1 || (n.length > h.length)) return -1;
        else if (h.length > (2**128 - 1)) return -1;

        uint subindex = 0;
        for (uint i = 0; i < h.length; i++) {
            if (h[i] == n[0]) {
                subindex = 1;
                while (subindex < n.length && (i + subindex) < h.length && h[i + subindex] == n[subindex]) {
                    subindex++;
                }
                if (subindex == n.length) return int(i);
            }
        }
        return -1;
    }
}
