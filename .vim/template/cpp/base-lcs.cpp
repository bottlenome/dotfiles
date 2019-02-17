#include <iostream>
#include <string>
#define S_MAX 1010
#define T_MAX 1010
#define INF 2 << 29

std::string S;
std::string T;
int dp[S_MAX][T_MAX];

int main() {
    std::cin >> S;
    std::cin >> T;

    memset(dp, 0, sizeof(dp));
    for (int i = 0; i < S_MAX; i++) {
        for (int j = 0; j < T_MAX; j++) {
            dp[i][j] = INF;
        }
    }
    dp[0][0] = 0;

    for (int i = 0; i < S.size(); i++) {
        for (int j = 0; j < T.size(); j++) {
            if (S[i] == T[j]) {
                dp[i + 1][j + 1] = std::max(dp[i][j] + 1, dp[i + 1][j + 1]);
            }
            dp[i + 1][j + 1] = std::max(dp[i + 1][j + 1], dp[i + 1][j]);
            dp[i + 1][j + 1] = std::max(dp[i + 1][j + 1], dp[i][j + 1]);
        }
    }

    std::cout << dp[S.size()][T.size()] << std::endl;

    return 0;
}
