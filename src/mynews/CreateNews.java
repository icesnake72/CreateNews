package mynews;

import com.google.gson.Gson;

import java.io.FileNotFoundException;
import java.io.FileReader;

public class CreateNews {
    public static void main(String[] args) {
        System.out.println("뉴스 API를 이용해 News데이터를 데이터베이스에 입력하기");



        // https://newsapi.org/v2/everything?apiKey=mmmmm&country=kr&category=business

        Gson gson = new Gson();
        try {
            NewsConfig config = gson.fromJson(new FileReader("src/mynews/news_config.json"),
                                              NewsConfig.class);

            String url = String.format("https://newsapi.org/v2/top-headlines?country=%s&category=%s&apiKey=%s",
                    config.country(), config.category(), config.key());

            NewsJasonParser newsClient = new NewsJasonParser();
            newsClient.loadFromUrl( url );

        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
