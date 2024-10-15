package com.sgt.socialmedia.service;

import com.sgt.socialmedia.repository.UserRepository;
import com.sgt.socialmedia.utilis.AppConstants;
import jakarta.servlet.http.Cookie;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserService {

    @Autowired
    JavaMailSender javaMailSender;
    @Autowired
    UserRepository userRepository;

    public ResponseEntity<Map<String, String>> insertUser(Map<String,Object> body){
        String user_name = (String) body.get("user_name");
        String email = (String) body.get("email");
        String contact = (String) body.get("contact");
        String password = (String) body.get("password");

        int noOfRows = userRepository.insertUser(user_name,email,contact , password);


        if(noOfRows>0){
            return ResponseEntity.ok(Map.of("status" , "successfully inserted user"));
        }
        return ResponseEntity.status(HttpStatus.NOT_ACCEPTABLE).body(Map.of("status" , "user insertion failed"));
    }
    public Map<String ,Object> loginUser(Map<String,Object> body){
        String user_name = (String)body.get("user_name");
        String password = (String)body.get("password");
        return userRepository.loginUser(user_name,password);
    }

    public List<String> getStudentsNames(HttpServletRequest httpServletRequest){
        boolean isValid = isTokenValidate(httpServletRequest);
        System.out.println(isValid);
        return  List.of("Kinjala" , "Jiya" , "Khushi", "Nidhi" , "Varsha" , "Muskan");
    }

    public boolean isTokenValidate(HttpServletRequest httpServletRequest){
//        System.out.println(httpServletRequest);
        //ertracting Cookies
        Cookie[] cookies = httpServletRequest.getCookies();

        //returning hashmap
        Map<String, String> cookieMap = getCookiesAsHashMap(cookies);
        Map<String, Object> result = userRepository.validateToken(Integer.parseInt(cookieMap.get("user_id")),cookieMap.get("token"));
        Integer validYn = (Integer) result.get("ValidYN");
        return validYn == 1;
    }

    private  Map<String, String> getCookiesAsHashMap(Cookie[] cookies){
        Map<String,String> cookieMap = new HashMap<>();
        for(Cookie c : cookies)
        {
            cookieMap.put(c.getName() , c.getValue());
            System.out.println(c.getName()+"-"+c.getValue());
        }
        return  cookieMap;
    }

    public void ValidateandSendMail(Map<String, Object>body){
        //Validate Email
        String email = (String)body.get("email");
        boolean validYN= validateEmail(email);
        if(!validYN){
            //handle return
        }
        // genrate token
        String token = generateToken(email);

        //3 mail
        String link = generateLink(token);
        sendMail(email,link);
    }

    public String generateLink(String token){
        return AppConstants.RESET_FRONT_END_URL+token;
    }
    public boolean validateEmail(String email){
        Map<String, Object> result = userRepository.validateEmail(email);
        return (Integer)result.get("validYN") == 1;
    }

    public String generateToken(String email){
        Map<String, Object>result = userRepository.generateToken(email);
        return (String)result.get("token");
    }

    public void sendMail(String email ,String link){
        MimeMessage mimeMessage = javaMailSender.createMimeMessage();
        MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage);
        try {
            mimeMessageHelper.setSubject("Forget Password : medium");
            mimeMessageHelper.setTo(email);
            mimeMessageHelper.setText("Forgot Password Link -"+link);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
        javaMailSender.send(mimeMessage);
    }

}
