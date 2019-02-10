#include <iostream>
#define A_MAX {{_input_:a_max}}
#define DP_MAX {{_input_:dp_max}}
int n;
int a[A_MAX];
int A;
int dp[A_MAX][DP_MAX];

int main() {
    std::cin >> n;
    for (int i = 0; i < n; i++) {
        std::cin >> a[i];
    }
    std::cin >> A;

    memset(dp, 0, sizeof(dp));
    dp[0][0] = 0;

    for (int i = 0; i < n; i++) {
        for (int j = 0; j <= A; j++) {
            {{_cursor_}}
        }
    }

    std::cout << dp[n][A] << std::endl;

    return 0;
}
