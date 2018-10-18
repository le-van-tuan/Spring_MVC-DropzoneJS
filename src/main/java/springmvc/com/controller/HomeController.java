package springmvc.com.controller;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import springmvc.com.model.ImageResponse;
import springmvc.com.storage.ImageStorage;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
public class HomeController {

    private ImageStorage imageStorage = new ImageStorage();

    private final String IMAGE_STORAGE_ATTRIBUTE = "image_storage";

    @RequestMapping(value = {"/", "/home"}, method = RequestMethod.GET)
    public String displayHomePage(HttpServletRequest request, Model model) {
        ImageStorage imageStorage = (ImageStorage) request.getSession().getAttribute(IMAGE_STORAGE_ATTRIBUTE);
        if (imageStorage != null) {
            System.out.println("Server has :  " + imageStorage.getImages().size() + " in cache.");
            model.addAttribute("uploadedImages", imageStorage);
        }
        return "home";
    }

    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    @ResponseBody
    public List<ImageResponse> uploadFile(MultipartHttpServletRequest request) {
        Map<String, MultipartFile> fileMap = request.getFileMap();
        System.out.println("User has upload : " + fileMap.size() + " image(s)");

        List<ImageResponse> imageResponses = new ArrayList<>();

        for (MultipartFile multipartFile : fileMap.values()) {
            CommonsMultipartFile commonsMultipartFile = (CommonsMultipartFile) multipartFile;

            String fileName = FilenameUtils.removeExtension(commonsMultipartFile.getFileItem().getName());
            String fileType = commonsMultipartFile.getContentType();

            imageStorage.addImage(fileName, multipartFile);

            ImageResponse imageResponse = new ImageResponse();
            imageResponse.setName(fileName);
            imageResponse.setType(fileType);

            imageResponses.add(imageResponse);
        }
        request.getSession().setAttribute(IMAGE_STORAGE_ATTRIBUTE, imageStorage);

        return imageResponses;
    }

    @RequestMapping(value = "/list-file", method = RequestMethod.GET)
    public String listFiles(Map<String, List<String>> map, HttpServletRequest request) {
        ImageStorage imageStorage = (ImageStorage) request.getSession().getAttribute(IMAGE_STORAGE_ATTRIBUTE);
        if (imageStorage != null) {
            System.out.println("Found " + imageStorage.getImages().size() + " image(s) from session.");

            List<String> filesName = new ArrayList<>(imageStorage.getImages().keySet());

            map.put("filesName", filesName);

            return "list_file";
        }
        return "no_file";
    }

    @RequestMapping(value = "/delete/{name}", method = RequestMethod.GET)
    public void deleteFile(@PathVariable String name, HttpServletRequest request) {
        ImageStorage imageStorage = (ImageStorage) request.getSession().getAttribute(IMAGE_STORAGE_ATTRIBUTE);
        if (!imageStorage.getImages().isEmpty()) {
            imageStorage.deleteImage(name);
            System.out.println("Delete image with name : " + name + " success!");
        }
        request.getSession().setAttribute(IMAGE_STORAGE_ATTRIBUTE, imageStorage);
    }
}
