import branchapp.dto.DivsAll;
import com.google.gson.Gson;


import java.io.*;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

public class Test {

    public static void main(String[] args) throws FileNotFoundException, UnsupportedEncodingException {
/*        Gson g = new Gson();
        DivsAll[] dto = new Gson().fromJson(new InputStreamReader(new FileInputStream("src/main/data111.json"),"UTF-8"), DivsAll[].class);

        List<DivsAll> divsAllList = Arrays.asList(dto);

        List<DivsAll> temp = divsAllList.stream().filter(d -> d.getDates().equals("01_01_2016") &&
                !d.getX().equals("АКОРДБАНК")).limit(29).collect(Collectors.toList());//.forEach(System.out::println);

        List<DivsAll> accord = divsAllList.stream().filter(d -> d.getDates().equals("01_01_2016") &&
                d.getX().equals("АКОРДБАНК")).collect(Collectors.toList());

        //temp.forEach(System.out::println);
        //accord.forEach(System.out::println);
        temp.addAll(accord);
        //temp.forEach(System.out::println);

        List<DivsAll> result = temp.stream().sorted(Comparator.comparingInt(DivsAll::getValue).reversed()).collect(Collectors.toList());
        //result.forEach(System.out::println);

        DivsAll[] res = result.toArray(new DivsAll[0]);*/


        /*divsAllList.stream().filter(d -> d.getDates().equals("01_01_2016") &&
                (d.getDates().equals("01_01_2016") && d.getX().equals("АКОРДБАНК"))).forEach(System.out::println);*/

        //divsAllList.forEach(System.out::println);

/*
        for (DivsAll d : dto) {
            System.out.println(d);
        }
*/

    }

}
