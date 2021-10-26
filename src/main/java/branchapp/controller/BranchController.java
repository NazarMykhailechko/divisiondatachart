package branchapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.persistence.*;
import java.io.IOException;
import java.util.List;

@Controller
public class BranchController {

/*    @PersistenceContext
    private EntityManager em;*/

    @RequestMapping("/")
    public String home(Model model) throws IOException {
        return "index";
    }


}
