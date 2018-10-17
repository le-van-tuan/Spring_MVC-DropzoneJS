package springmvc.com.storage;

import java.util.HashMap;
import java.util.Map;

public class ImageStorage {

    private static Map<String, byte[]> images = new HashMap<>();

    /**
     *
     * @param name
     * @param imageData
     */
    public void addImage(String name, byte[] imageData){
        images.put(name, imageData);
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
    public Map<String, byte[]> getImages(){
        return images;
    }
}
