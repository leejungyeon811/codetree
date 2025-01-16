#include <iostream>
#include <vector>
#include <algorithm>
#include <tuple>
using namespace std;

int main() {
	int n;
	cin >> n;
	vector<int> vec(n);
	for (int i = 0; i < n; i++) {
		cin >> vec[i];
	}

	vector<tuple<int, int, int>> dp(n,{ 1, 1, 1 });
	for (int i = 1; i < n; i++) {
		for (int j = 0; j < i; j++) {
			if (vec[i] > vec[j]) {
				get<0>(dp[i]) = max(get<0>(dp[i]), get<0>(dp[j]) + 1); //증가수열
			}
			else if (vec[i] < vec[j]) {
				get<1>(dp[i]) = max(get<1>(dp[i]), get<1>(dp[j]) + 1); //감소수열

				if (get<2>(dp[j]) > 1) { //증가했다가 감소하는 수열이었을 때
					get<2>(dp[i]) = max(get<2>(dp[j]) + 1, get<2>(dp[i]));
				}
				if (get<0>(dp[j]) > 1 && get<2>(dp[j]) == 1) {//증가했다가 감소하는 수열의 첫 감소 부분일 때
					get<2>(dp[i]) = max(get<0>(dp[j]) + 1, get<2>(dp[i]));
				}
			}
		}
	}


	int large=0;
	for (int i = 0; i < n; i++) {
		if (large < get<0>(dp[i])) large = get<0>(dp[i]);
		if (large < get<1>(dp[i])) large = get<1>(dp[i]);
		if (large < get<2>(dp[i])) large = get<2>(dp[i]);
	}

	cout << large;
}
