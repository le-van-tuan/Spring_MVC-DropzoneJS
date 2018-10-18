package springmvc.com.storage;

import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.Map;

public class ImageStorage {

    private static Map<String, MultipartFile> images = new HashMap<>();

    /**
     *
     * @param name
     * @param multipartFile
     */
    public void addImage(String name, MultipartFile multipartFile){
        images.put(name, multipartFile);
    }

    /**
     *
     * @param name
     */
    public void deleteImage(String name){
        images.remove(name);
    }

    /**
     *
     * @return
     */
    public Map<String, MultipartFile> getImages(){
        return images;
    }
}
