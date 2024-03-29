package ru.nikitin.marketwinter;

import ru.nikitin.marketwinter.controllers.AdminController;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;

import static org.springframework.security.test.web.servlet.response.SecurityMockMvcResultMatchers.authenticated;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.xpath;

@RunWith(SpringRunner.class)
@SpringBootTest
@AutoConfigureMockMvc
@TestPropertySource("/database.properties")
public class MainControllerTest {
//    @Autowired
//    private MockMvc mockMvc;
//
//    @Autowired
//    private AdminController adminController;
//
//    @Test
//    public void adminPageTest() throws Exception {
//        mockMvc.perform(get("/admin"))
//                .andDo(print())
//                .andExpect(authenticated())
//                .andExpect(xpath("/html/body/div[2]/h1").string("admin"));
//    }
}
