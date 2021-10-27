package branchapp.controller;

import branchapp.dto.Division;
import branchapp.dto.Divs;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

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

}
