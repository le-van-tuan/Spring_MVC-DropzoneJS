package springmvc.com.storage;

import java.util.HashMap;
import java.util.Map;

public class ImageStorage {

    private static Map<String, String> images = new HashMap<>();

    /**
     *
     * @param name
     * @param base64
     */
    public void addImage(String name, String base64){
        images.put(name, base64);
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
    public Map<String, String> getImages(){
        return images;
    }
}
