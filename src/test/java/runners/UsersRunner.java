package runners;

import com.intuit.karate.junit5.Karate;

public class UsersRunner {

    @Karate.Test
    Karate testUsers() {
        return Karate.run("classpath:features/getUsers.feature", "classpath:features/postUser.feature", "classpath:features/getUserId.feature",
                "classpath:features/delUserId.feature", "classpath:features/putUserId.feature");

    }
}
