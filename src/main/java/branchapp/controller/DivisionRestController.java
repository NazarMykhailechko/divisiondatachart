package branchapp.controller;

import branchapp.dto.Division;
import branchapp.dto.Divs;
import branchapp.dto.DivsAll;
import com.google.gson.Gson;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/divisions")
public class DivisionRestController {

    @PersistenceContext
    private EntityManager em;


    @RequestMapping(value = "findall/{data}", method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<Iterable<Divs>> findAll(@PathVariable String data) {

        List<Divs> res = em.createNamedQuery("Divisions", Divs.class).setParameter(1,data).getResultList();

        try {
            return new ResponseEntity<Iterable<Divs>>(res, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<Iterable<Divs>>(HttpStatus.BAD_REQUEST);
        }
    }

    @RequestMapping(value = "findall", method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<Iterable<DivsAll>> findAllData() {

        List<DivsAll> res = em.createNamedQuery("DivisionsAll", DivsAll.class).getResultList();

        try {
            return new ResponseEntity<Iterable<DivsAll>>(res, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<Iterable<DivsAll>>(HttpStatus.BAD_REQUEST);
        }
    }

    @RequestMapping(value = "divsall/{data}", method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<Iterable<DivsAll>> divsAll(@PathVariable String data) throws FileNotFoundException, UnsupportedEncodingException {

        DivsAll[] dto = new Gson().fromJson(new InputStreamReader(new FileInputStream("src/main/data.json"),"UTF-8"), DivsAll[].class);

        List<DivsAll> divsAllList = Arrays.asList(dto);

        List<DivsAll> temp = divsAllList.stream().filter(d -> d.getDates().equals(data) &&
                !d.getX().equals("АКОРДБАНК")).limit(29).collect(Collectors.toList());//.forEach(System.out::println);

        List<DivsAll> accord = divsAllList.stream().filter(d -> d.getDates().equals(data) &&
                d.getX().equals("АКОРДБАНК")).collect(Collectors.toList());

        //temp.forEach(System.out::println);
        //accord.forEach(System.out::println);
        temp.addAll(accord);
        //temp.forEach(System.out::println);

        List<DivsAll> result = temp.stream().sorted(Comparator.comparingInt(DivsAll::getValue).reversed()).collect(Collectors.toList());
        //result.forEach(System.out::println);

        //DivsAll[] res = result.toArray(new DivsAll[0]);

        //List<DivsAll> res = em.createNamedQuery("DivisionsAll", DivsAll.class).getResultList();

        try {
            return new ResponseEntity<Iterable<DivsAll>>(result, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<Iterable<DivsAll>>(HttpStatus.BAD_REQUEST);
        }
    }

}
